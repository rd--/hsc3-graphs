// contamination zone ; jmcc #9 ; graph rewrite
var z = OverlapTexture({
    arg tr;
    var f = TExpRand.kr(800, 8000, tr);
    var s = PinkNoise.ar() * (LFNoise1.kr(TRand(0, 3, tr)) * 0.0008 + 0.0022);
    var r = RingzBank.ar(s, { TRand.kr(50, 2000, tr) }.dup(4), [1], { TRand.kr(0.2, 4, tr) }.dup(4)).abs * TChoose.kr(tr, #[-1, 1]);
    Pan2.ar(
        RLPF.ar(r, SinOsc.kr(TRand.kr(0, 1, tr), 0) * 0.7 * f + f, 0.1),
        LFNoise1.kr(TRand.kr(0, 1, tr)),
        LFPulse.kr(TRand.kr(0, 15, tr), 0, TRand.kr(0.2, 0.4, tr))
    )
}, 8, 3, 4);
6.timesRepeat({ z = AllpassC.ar(z, 0.040, { Rand.ir(0, 0.04) }.dup, 16) });
z
