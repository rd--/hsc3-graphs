;; Rcd ;  auto-reset on ...
var freqs = (0 .. 7).collect { :i | (i + 1) * 100 };
var decays = (0 .. 7).collect { :i | 1 / (i + 1) };
var clock = LfPulse(8, 0, 0.001);
var rotate = 7;
var spread = 1;
var len = 23;
var pulses = Rcd(clock, rotate, 0, 0, spread, 1, len, 0, 0);
var out = Ringz(pulses, freqs, decays) * 0.05;
Splay2(out)
