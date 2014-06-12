// resonators harmonic series (jmcc) #2

"/home/rohan/sw/hsc3-graphs/gr/overlap-texture.scd".load;

~xfade_texture.({
    var p = 12; // number of overtones
    var noise = BrownNoise.ar(0.001);
    // a list representing a just diatonic scale expressed as ratios.
    var rat = #[1.0,1.125,1.25,1.333,1.5,1.667,1.875,2.0,2.25,2.5,2.667,3.0,3.333,3.75,4.0];
    // one value is chosen at random and multiplied by a 120 Hz fundamental
    var freq = rat.choose * 120.0;
    var resFreqs = Array.series(p, freq, freq) + Array.fill(p, { 0.5.rand2 });
    var spec = Array.fill(2, {
        `[  // filter bank specification
            resFreqs,
            Array.fill(p, { arg i; 1/(i+1) }),
            Array.fill(p, { 0.5 + 4.0.rand })
        ]
    });
    Klank.ar(spec, noise);
}, 1, 7);
