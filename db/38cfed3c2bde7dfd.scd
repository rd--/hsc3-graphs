// https://twitter.com/alln4tural/status/99846300173991936 ; graph rewrite
OverlapTexture({
    arg tr;
    var h = TChoose.kr(tr, [33, 38, 40]).midicps * (2 ** TChoose.kr(tr, 0.to(4)));
    { SinOsc.ar(TExpRand.kr(h - (h / 64), h + (h / 64), tr), 0) * 0.025 }.dup(8).splay
}, 1, 9, 40)