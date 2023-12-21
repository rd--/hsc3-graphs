(* Rcd ; auto-reset on *)
var freqs = (1 .. 8) * 100;
var decays = 1 / (1 .. 8);
var clock = LfPulse(8, 0, 0.001);
var rotate = 7;
var spread = 1;
var len = 23;
var pulses = Rcd(clock, rotate, 0, 0, spread, 1, len, 0, 0);
var out = Ringz(pulses, freqs, decays) * 0.05;
Splay2(out)
