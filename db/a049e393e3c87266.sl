;; CombL ; karplus-strong ; mouse control (adc)
var freq = MouseX(220, 1760, 1, 0.2);
var repeatFreq = 0.3;
var exciter = Decay(Impulse(repeatFreq, 0), 0.02) * PinkNoise();
var string = CombL(exciter, 0.1, 1 / freq, 3);
[string, LeakDc(string, 0.995)]
