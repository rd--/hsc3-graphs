;; Rcd ; div16
var trig = LfPulse(8, 0, 0.001);
var freqs = (0 .. 7).collect { :i | (i + 1) * 100 };
var rotate = 0;
var div = 1;
var pulses = Rcd(trig, rotate, 0, div, 0, 0, 0, 0, 0);
var out = Ringz(pulses, freqs, [2, 1, 0.5, 0.3, 0.2, 0.3, 0.5, 1]) * 0.05;
Splay2(out)
