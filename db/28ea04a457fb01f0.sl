(* CombN ; karplus-strong ; mouse control of frequency ; no interpolation (adc) *)
var freq = MouseX(220, 1760, 1, 0.2);
var repeatFreq = 0.3;
var exciter = Decay(Impulse(repeatFreq, 0), 0.02) * PinkNoise();
CombN(exciter, 0.1, 1 / freq, 3)
