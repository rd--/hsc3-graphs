// contamination zone (jmcc)

"/home/rohan/sw/hsc3-graphs/gr/overlap-texture.scd".load;

~contamination_zone = {
    var f = exprand(800, 8000);
    Pan2.ar(
        RLPF.ar(
            Klank.ar(
                `[
                    Array.rand(4, 50.0, 2000.0),
                    nil,
                    Array.rand(4, 0.2, 4.0)
                ],
                PinkNoise.ar(LFNoise1.kr(3.0.rand, 0.0008, 0.0022))
            ).abs * #[-1, 1].choose,
            SinOsc.kr(1.0.linrand, 0, 0.7 * f, f),
            0.1
        ),
        LFNoise1.kr(1.0.rand),
        LFPulse.kr(15.0.linrand, 0.2 + 0.2.rand)
    )
};
~overlap_texture.(~contamination_zone, 8, 3, 4);
~post_process.({
    arg z;
    6.do({ z = AllpassN.ar(z, 0.1, [0.05.rand,0.05.rand], 4)});
    z;
});
