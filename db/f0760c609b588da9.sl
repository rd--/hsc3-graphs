/* SinOsc ; used as both oscillator and lfo */
let f = SinOsc(4, 0);
SinOsc(f * 200 + 400, 0) * 0.1
