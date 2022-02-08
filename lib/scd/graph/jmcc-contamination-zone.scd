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

//---- contamination zone ; jmcc #9
RTexture.overlap({
    var f = 800.exprand(8000);
    Pan2.ar(
        RLPF.ar(
            Klank.ar(
                `[
                    Array.rand(4, 50.0, 2000.0),
                    nil,
                    Array.rand(4, 0.2, 4.0)
                ],
                PinkNoise.ar() * (LFNoise1.kr(3.0.rand) * 0.0008 + 0.0022)
            ).abs * #[-1, 1].choose,
            SinOsc.kr(1.0.linrand, 0) * 0.7 * f + f,
            0.1
        ),
        LFNoise1.kr(1.0.rand),
        LFPulse.kr(15.0.linrand, 0, 0.2 + 0.2.rand)
    )
}, 8, 3, 4, 2, postProcess: {arg z;
	6.do({
		z = AllpassN.ar(z, 0.040, [0.040.rand,0.040.rand], 16)
	});
	z
})
