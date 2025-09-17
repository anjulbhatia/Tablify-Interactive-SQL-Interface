from flask import Flask, render_template, request, jsonify, abort
import pandas as pd
import duckdb
import os
import re
from pathlib import Path

app = Flask(__name__, static_folder="static", template_folder="templates")

DATA_DIR = Path("public/data")
SNIPPET_DIR = Path("public/snippets")

def table_name_from_filename(fn: str) -> str:
    name = os.path.splitext(fn)[0]
    return re.sub(r'[^0-9a-zA-Z_]', '_', name)

def is_safe_read_query(sql: str) -> bool:
    if not sql or not sql.strip():
        return False
    lower = sql.lower()
    if ';' in sql.strip().rstrip(';'):
        return False
    blacklist = [
        'insert ', 'update ', 'delete ', 'drop ', 'alter ',
        'create ', 'attach ', 'detach ', 'pragma ', 'replace ',
        'vacuum', 'transaction', 'commit', 'rollback'
    ]
    if any(tok in lower for tok in blacklist):
        return False
    return True

@app.route('/')
def index():
    return render_template("index.html", snippet_slug=None)

@app.route('/<snippet_slug>')
def snippet_page(snippet_slug):
    filename = f"{snippet_slug}.sql"
    safe_path = SNIPPET_DIR.joinpath(filename)
    if not safe_path.exists():
        abort(404)
    return render_template("index.html", snippet_slug=snippet_slug)

@app.route('/api/files')
def list_files():
    data_files = []
    snippet_files = []
    if DATA_DIR.exists():
        data_files = sorted([f.name for f in DATA_DIR.iterdir() if f.is_file() and f.suffix.lower() in ['.csv', '.tsv']])
    if SNIPPET_DIR.exists():
        snippet_files = sorted([f.name for f in SNIPPET_DIR.iterdir() if f.is_file() and f.suffix.lower() in ['.sql', '.txt']])
    return jsonify({"data_files": data_files, "snippet_files": snippet_files})

@app.route('/api/snippet/<path:filename>')
def get_snippet(filename):
    safe_path = SNIPPET_DIR.joinpath(filename)
    try:
        if not safe_path.resolve().is_file() or SNIPPET_DIR.resolve() not in safe_path.resolve().parents and safe_path.resolve().parent != SNIPPET_DIR.resolve():
            return abort(404)
        with open(safe_path, "r", encoding="utf-8") as f:
            content = f.read()
        description = ""
        for line in content.splitlines():
            line = line.strip()
            if line.startswith('--'):
                description = line[2:].strip()
                break
        return jsonify({"filename": filename, "content": content, "description": description})
    except Exception:
        return abort(404)

@app.route('/api/run', methods=['POST'])
def run_query():
    payload = request.get_json(force=True)
    sql = payload.get("query", "")
    if not is_safe_read_query(sql):
        return jsonify({"error": "Query rejected by safety rules (only single read-only SELECT/WITH queries allowed)."}), 400
    
    conn = duckdb.connect(database=':memory:')
    try:
        # Load data files into DuckDB
        for f in DATA_DIR.glob("*"):
            if not f.is_file() or f.suffix.lower() not in [".csv", ".tsv"]:
                continue
            table_name = table_name_from_filename(f.name)
            delimiter = '\t' if f.suffix.lower() == ".tsv" else ','
            try:
                df = pd.read_csv(f, delimiter=delimiter)
                df.columns = [re.sub(r'[^0-9a-zA-Z_]', '_', str(c)) for c in df.columns]
                conn.register(table_name, df)
            except Exception as e:
                return jsonify({"error": f"Error loading file {f.name}: {str(e)}"}), 400
        
        try:
            result_df = conn.execute(sql).df()
        except Exception as e:
            return jsonify({"error": f"SQL execution error: {str(e)}"}), 400
        
        html_table = result_df.to_html(index=False, classes="table-auto border-collapse w-full", border=0, justify='left', escape=True)
        return jsonify({
            "html": html_table,
            "columns": list(result_df.columns),
            "rows": result_df.head(1000).to_dict(orient="records"),
            "row_count": len(result_df)
        })
    finally:
        conn.close()

@app.errorhandler(404)
def page_not_found(e):
    return render_template("404.html"), 404

if __name__ == "__main__":
    app.run(debug=True, port=3333)
