// sawed cymbals (jmcc) ; #10 ; graph rewrite
var p = 15;
OverlapTexture({
    arg tr;
    var f1 = TRand.kr(500, 2500, tr);
    var f2 = TRand.kr(0, 8000, tr);
    var s = LFSaw.ar(TXLine.kr(TRand.kr(0, 600, tr), TRand.kr(0, 600, tr), 12, tr), 0, 0.0005);
    { RingzBank.ar(s, { f1 + TRand.kr(0, f2, tr)}.dup(p), nil, { TRand.kr(2, 6, tr) }.dup(p)) }.dup * 0.1;
}, 4, 4, 6, 2)
