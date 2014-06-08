// cymbalism accellerando (jmcc)

"/home/rohan/sw/hsc3-graphs/gr/overlap-texture.scd".load;

~xfade_texture.({
    var p = 15; // number of partials per channel per 'cymbal'.
    var f1 = 500 + 2000.0.rand;
    var f2 = 8000.0.rand;
    var z = Array.fill(2, {
        `[  // sine oscil bank specification:
            y = Array.fill(p, { f1 + f2.rand} ), // frequencies
            nil, // amplitudes default to 1.0
            Array.fill(p, { 1.0 + 4.0.rand }) // ring times
        ]
    });
    var tf = XLine.kr(4.0.linrand + 0.5, 35.0.rand + 0.5, 12);
    var t = Impulse.ar(tf);
    Klank.ar(z, Decay.ar(t, 0.004, WhiteNoise.ar(0.02)));
}, 4, 4);
