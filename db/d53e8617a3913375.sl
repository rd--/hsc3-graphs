{- CombL ; karplus-strong ; mouse control (adc) -}
let freq = MouseX(220, 1760, 1, 0.2);
let repeatFreq = 0.3;
let exciter = Decay(Impulse(repeatFreq, 0), 0.02) * PinkNoise();
let string = CombL(exciter, 0.1, 1 / freq, 3);
[string, LeakDc(string, 0.995)]
