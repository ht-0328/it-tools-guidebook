// ```mermaid の塊を図として描く。
// Zensical は塊に印を付けるところまでを行い、描画する部品は同梱しない。
// そのため mermaid.min.js をここから呼び出す。取得は tools/build_site.sh が行う。
//
// pymdownx.superfences の出力は <pre class="mermaid"><code>…</code></pre> であり、
// code が入れ子になっている。mermaid が要素の中身を丸ごと構文として読むと
// タグが混ざって "Syntax error in text" になる。描く前に中身を平らな文字へ置き換える。
document.addEventListener("DOMContentLoaded", function () {
  if (typeof mermaid === "undefined") { return; }

  document.querySelectorAll("pre.mermaid").forEach(function (pre) {
    var code = pre.querySelector("code");
    if (code) { pre.textContent = code.textContent; }
  });

  mermaid.initialize({ startOnLoad: true, theme: "neutral", securityLevel: "strict" });
});
