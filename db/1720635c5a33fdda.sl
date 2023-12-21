(* CombL ; karplus-strong ; very small frequency range ; note changes in sound quality of the decay (adc) *)
var freq = MouseX(220, 1760, 1, 0.2);
var delayTime = MouseX(1 / 100, 1 / (100 + 2), 0, 0.1);
var repeatFreq = 0.3;
var exciter = Decay(Impulse(repeatFreq, 0), 0.02) * PinkNoise();
var string = CombL(exciter, 0.1, delayTime, 3);
[string, LeakDc(string, 0.995)]
