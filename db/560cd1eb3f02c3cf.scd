// repeating harmonic Klank
Texture.overlapGraph({
    arg tr;
    var p = 8; // number of partials per channel
    var s = Decay.ar(Dust.ar(0.8) * 0.01, 3.4) * LFSaw.ar(TRand.kr(0, 40, tr), 0); // linrand
    var f = TChoose.kr(tr, #[400, 500, 600, 700, 800, 900, 1000, 1200, 1400, 1500, 1600]);
    { Klank.ar([{ f * TRand.kr(1, 13, tr) }.dup(p), nil, { TRand.kr(0.4, 3.4, tr) }.dup(p)].asRef, s) }.dup
}, 8, 2, 4)
