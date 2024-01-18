{- CombL ; karplus-strong ; very small frequency range ; note changes in sound quality of the decay (adc) -}
let freq = MouseX(220, 1760, 1, 0.2);
let delayTime = MouseX(1 / 100, 1 / (100 + 2), 0, 0.1);
let repeatFreq = 0.3;
let exciter = Decay(Impulse(repeatFreq, 0), 0.02) * PinkNoise();
let string = CombL(exciter, 0.1, delayTime, 3);
[string, LeakDc(string, 0.995)]
