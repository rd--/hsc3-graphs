{- CombN ; karplus-strong ; mouse control of frequency ; no interpolation (adc) -}
let freq = MouseX(220, 1760, 1, 0.2);
let repeatFreq = 0.3;
let exciter = Decay(Impulse(repeatFreq, 0), 0.02) * PinkNoise();
CombN(exciter, 0.1, 1 / freq, 3)
