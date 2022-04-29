// tarmac ; jmcc #10 ; graph rewrite
var a = [
    #[1, 0, 0],
    #[1, 1, 0],
    #[1, 1, 0, 0],
    #[1, 1, 1, 0, 0, 0],
    #[1, 1, 1, 0, 0, 0, 0, 0],
    #[1, 1, 1, 1, 0, 0, 0, 0],
    #[1, 1, 1, 1, 1, 0, 0, 0],
    #[1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
];
OverlapTexture({
    arg tr;
    var t = Impulse.kr(8, 0);
    var i = Demand.kr(t, 0, Dseq.dr(TScramble.kr(tr, TChoose.kr(tr, a)), inf)) * t;
    var d = TRand.kr(0.05, 0.5, tr);
    var z = PinkNoise.ar * (LFNoise1.kr(TRand.kr(0, 3, tr)) * 0.0008 + 0.0022);
    var s = { Ringz.ar(z, TRand.kr(50, 4000, tr), TRand.kr(0.2, 12, tr)) }.dup(4).sum.max(0) * TChoose.kr(tr, #[-1, 1]);
    var f = RLPF.ar(s, Decay2.kr(t, 0.004, d) * TRand.kr(0, 5000, tr) + TRand.kr(0, 100, tr) + 100, 0.2);
    var e = Decay2.kr(i, 0.004, d);
    Pan2.ar(f, LFNoise1.kr(TRand.kr(0, 1, tr)), e)
}, 12, 3, 1) * 0.2;

//---- tarmac ; jmcc #10
var a = #[
    [1, 0, 0],
    [1, 1, 0],
    [1, 1, 0, 0],
    [1, 1, 1, 0, 0, 0],
    [1, 1, 1, 0, 0, 0, 0, 0],
    [1, 1, 1, 1, 0, 0, 0, 0],
    [1, 1, 1, 1, 1, 0, 0, 0],
    [1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
];
RTexture.overlap({
    arg i;
    var imp_seq = { arg s, tr; Demand.kr(tr, 0, Dseq.dr(s, inf)) * tr };
    var t = Impulse.kr(8, 0);
    var d = Rand.ir(0.05, 0.5);
    var z = PinkNoise.ar * (LFNoise1.kr(Rand.ir(0, 3)) * 0.0008 + 0.0022);
    var s = Klank.ar(Ref.new([Array.linrand(4, 50.0, 4000.0), nil, Array.rand(4, 0.2, 12.0)]), z).max(0) * #[-1, 1].choose;
    var f = RLPF.ar(s, Decay2.kr(t, 0.004, d, Rand.ir(0, 5000), Rand.ir(0, 100) + 100),  0.2);
    var e = Decay2.kr(imp_seq.value(a.choose.scramble, t), 0.004, d);
    Pan2.ar(f, LFNoise1.kr(Rand.ir(0, 1)), e);
}, 12, 3, 6, 2);
