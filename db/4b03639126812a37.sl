;; Rcd ; rotation
var freqs = (0 .. 7).collect { :i | (i + 1) * 100 };
var decays = (0 .. 7).collect { :i | 8 / (i + 1) };
var trig = LfPulse(5, 0, 0.005);
var rotate = LfNoise0(0.3) * 8 + 8;
var reset = 0;
var spread = 1;
var metronome = Ringz(trig, 6000, 0.01) * 0.03;
var pulses = Rcd(trig, rotate, reset, 3, spread, 0, 0, 0, 0);
var out = Ringz(pulses, freqs, decays) * 0.05;
Splay2(out * 0.7).Tanh + metronome
