#!/usr/bin/env python3
"""このリポジトリの Markdown を、ドキュメント標準の doc_lint で検査する。

doc_lint は、自分が置かれたリポジトリの根を検査の基準にする。サブモジュールとして
取り込むと基準が standards/engineering-docs-standard/ になり、このリポジトリの文書が
検査対象から外れる。そのため、基準だけを差し替えて呼び出す。

検査ルールと対象の正本は standards/engineering-docs-standard/.doclint.yml である。
このファイルはルールを持たない。
"""

import sys
from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parent.parent
STANDARD = REPO_ROOT / "standards" / "engineering-docs-standard"

if not (STANDARD / "tools" / "doc_lint.py").is_file():
    sys.exit(
        "サブモジュールが空である。"
        "git submodule update --init --recursive を実行する"
    )

sys.path.insert(0, str(STANDARD / "tools"))

import doc_lint  # noqa: E402  読み込み経路を通したあとで取り込む

doc_lint.ROOT = REPO_ROOT

raise SystemExit(doc_lint.main())
