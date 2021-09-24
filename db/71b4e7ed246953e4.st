"SinOsc ; When two pure tones of slightly different frequency are superposed, our ears
perceive audible beats at a rate given by the difference of the two frequencies."
| f0 f1 d i |
f0 := 220.
f1 := 221.25.
d := (f1 - f0) abs.
i := Impulse freq: d phase: 0 mul: ((SinOsc freq: 0.05 phase: 0 mul: 0.1) max: 0).
SinOsc freq: {f0. f1} phase: 0 mul: 0.1 add: i
