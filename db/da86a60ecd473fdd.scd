// repeating inharmonic Klank ; jmcc #6 ; graph rewrite
var n = 4;
var p = 8;
OverlapTexture({
    arg tr;
    var s = Decay.ar(Dust.ar(0.8) * 0.004, 3.4) * LFSaw.ar(TRand.kr(0, 40, tr), 0);
    { RingzBank.ar(s, { TRand.kr(80, 10000, tr) }.dup(p), [1], { TRand.kr(0.4, 4.4, tr) }.dup(p)) }.dup
}, 8, 8, n);
