// Squine ; fm patch
Squine.ar(
    Squine.ar(100, SinOsc.ar(0.3, 0) * 0.5 + 0.5, Ln.ar(-1, 1, 20), 0) * 200 + 300,
    SinOsc.ar(0.3, 0) * 0.5 + 0.5,
    SinOsc.ar(1.1, 0),
    iminsweep: 4
) * 0.1
