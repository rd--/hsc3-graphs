(* Rcd ; rotation *)
var freqs = (1 .. 8) * 100;
var decays = 8 / (1 .. 8);
var trig = LfPulse(5, 0, 0.005);
var rotate = LfNoise0(0.3) * 8 + 8;
var reset = 0;
var spread = 1;
var metronome = Ringz(trig, 6000, 0.01) * 0.03;
var pulses = Rcd(trig, rotate, reset, 3, spread, 0, 0, 0, 0);
var out = Ringz(pulses, freqs, decays) * 0.05;
Splay2(out * 0.7).Tanh + metronome
