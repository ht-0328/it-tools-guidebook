// ```mermaid の塊を図として描く。
// Zensical は塊に印を付けるところまでを行い、描画する部品は同梱しない。
// そのため mermaid.min.js をここから呼び出す。取得は tools/build_site.sh が行う。
document.addEventListener("DOMContentLoaded", function () {
  if (typeof mermaid === "undefined") { return; }
  mermaid.initialize({ startOnLoad: true, theme: "neutral", securityLevel: "strict" });
});
