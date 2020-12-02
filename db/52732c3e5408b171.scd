// MiElements ; strike input ; playing chords ; model=strings
{var input = Decay.ar(Dust.ar(1), 0.01);
 var g = LFNoise1.kr(0.1,0.5,0.5);
 MiElements.ar(0, input, pit: 53, geom: g, bright:0.5, damp:0.9, model:2)}
