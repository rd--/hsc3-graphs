;; Rcd ; gates
var freqs = (0 .. 7).collect { :i | (i * 5 + 50).MidiCps };
var amps = [1, 0.5, 0.3, 0.3, 0.3, 0.2, 0.2, 0.2];
var trig = LfPulse(7, 0, 0.01);
var rotate = -2;
var spread = TiRand(0, 1, Impulse(0.13, 0));
var div = TiRand(0, 3, Impulse(0.1, 0));
var pulses = Rcd(trig, rotate, 0, div, spread, 0, 0, 0, 1);
var oscs = SinOsc(freqs, 0) * pulses * amps;
var out = Splay2(oscs.rotateLeft(3) * 0.5);
out  + (CombN(out, 2, [2, 1], 3) * 0.3)
