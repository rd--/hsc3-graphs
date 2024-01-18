{- SinOsc ; phase input ; constant frequency -}
let freq = 440;
let rate = 2 * pi * freq / SampleRate();
let phase = Phasor(1, rate, 0, 2 * pi, 0);
SinOsc(0, phase) * 0.1
