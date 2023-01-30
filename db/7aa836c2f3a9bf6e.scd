// bouncing objects ; jmcc #2 ; lightbulbs, pencils, cans, and other assorted objects ; graph rewrite
OverlapTexture({
    arg tr;
    var i = Impulse.ar(TxLine.kr(TRand.kr(3, 7, tr), 600, 4, tr), 0);
    var s = Decay.ar(i * TxLine.kr(0.09, 0.000009, 4, tr), 0.001);
    var r = { Ringz.ar(s, TRand.kr(400, 8400, tr), TRand.kr(0.01, 0.1, tr)) * TRand.kr(0, 1, tr) }.dup(4).sum;
    Pan2.ar(r, TRand.kr(-1, 1, tr), 1)
}, 6, 0.01, 4)
