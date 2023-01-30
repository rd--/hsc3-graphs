;; Integrator ; as envelope
var tr = LfPulse(MouseX(3, 21, 1, 0.2), 0.2, 0.0004);
Integrator(tr, TRand(0.996, 0.999, tr)) * FSinOsc(700, 0) * 0.1
