// https://twitter.com/alln4tural/status/99846300173991936 ; graph rewrite
OverlapTexture({
    arg tr;
    var h = TChoose.kr(tr, [33, 38, 40]).midicps * (2 ** TChoose.kr(tr, 0.to(5)));
    { SinOsc.ar(TExpRand.kr(h - (h / 256), h + (h / 256), tr), 0) * 0.025 }.dup(64).splay
}, 1, 9, 5)
