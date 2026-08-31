#!/usr/bin/env bash
# docs/ から Zensical でサイトを作る。ホストには何も入れない。
#
#   bash tools/build_site.sh
#
# Zensical は docs_dir の中だけをサイトにする。docs/ には docs_dir の外を指すリンクが
# あるため、行き先を公開先の URL へ書き換えた写しを build/zensical/ に作ってから読ませる。
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$REPO_ROOT"

GUIDEBOOK="https://github.com/ht-0328/it-tools-guidebook/blob/main"
STANDARD="https://github.com/ht-0328/engineering-docs-standard/blob/main"

rm -rf build/zensical
mkdir -p build/zensical
cp docs/*.md build/zensical/

# docs_dir の外を指すリンクを、公開先から開ける URL へ置き換える。
sed -i \
  -e "s#](\.\./templates/#](${GUIDEBOOK}/templates/#g" \
  -e "s#](\.\./standards/engineering-docs-standard/#](${STANDARD}/#g" \
  build/zensical/*.md

# 置き換え漏れがあれば止める。壊れたリンクを公開しない。
if grep -rn '](\.\./' build/zensical/ ; then
  echo "docs_dir の外を指すリンクが残っている。上の行を書き換える" >&2
  exit 1
fi

docker run --rm --user "$(id -u):$(id -g)" \
  -v "$REPO_ROOT:/w" -w /w edocs-zensical zensical build

echo "作った: $REPO_ROOT/site"
