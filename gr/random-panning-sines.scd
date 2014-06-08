// random panning sines (jmcc) #4

"/home/rohan/sw/hsc3-graphs/gr/overlap-texture.scd".load;

~xfade_texture.({
    var n = 8;
    Mix.ar(Array.fill(n, {
        Pan2.ar(
            FSinOsc.ar(80 + 2000.0.linrand),
            LFNoise1.kr(0.4 + 0.8.rand),
                LFNoise1.kr(0.4 + 0.8.rand, 0.4, 0.5)
        )
        })) * (0.4 / n);
}, 8, 8);
