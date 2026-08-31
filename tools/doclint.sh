#!/usr/bin/env bash
# このリポジトリの Markdown を検査する。中身は tools/doclint.py が行う。
# ホストには何も入れない。検査は edocs-tools イメージの中で動く。
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

docker run --rm --user "$(id -u):$(id -g)" \
  -v "$REPO_ROOT:/w" -w /w edocs-tools \
  python tools/doclint.py "$@"
