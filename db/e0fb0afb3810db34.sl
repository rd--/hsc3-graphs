(* CombL ; simplistic karplus-strong synthesis (adc) *)
var freq = 440;
var repeatFreq = 0.3;
var exciter = Decay(Impulse(repeatFreq, 0), 0.01) * PinkNoise();
var string = CombL(exciter, 0.1, 1 / freq, 3);
[string, LeakDc(string, 0.995)]
