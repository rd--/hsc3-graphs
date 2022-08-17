// MiElements ; strike input ; playing chords ; model=2=strings
var strike_in = Decay.ar(Dust.ar(1), 0.01);
var geom = LFNoise1.kr(0.1,0.5,0.5);
MiElements.ar(blow_in: 0, strike_in: strike_in, pit: 53, geom: geom, bright:0.5, damp:0.9, model:2)
