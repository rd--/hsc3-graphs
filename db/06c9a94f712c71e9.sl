{- CombL ; simplistic karplus-strong synthesis (adc) -}
let freq = 440;
let repeatFreq = 0.3;
let exciter = Decay(Impulse(repeatFreq, 0), 0.01) * PinkNoise();
let string = CombL(exciter, 0.1, 1 / freq, 3);
[string, LeakDc(string, 0.995)]
