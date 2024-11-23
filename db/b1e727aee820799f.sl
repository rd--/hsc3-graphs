/* Rcd ; gates */
let freqs = (0:7 * 5 + 50).MidiCps;
let amps = [10 5 3 3 3 2 2 2] / 10;
let trig = LfPulse(7, 0, 0.01);
let rotate = -2;
let spread = TiRand(0, 1, Impulse(0.13, 0));
let div = TiRand(0, 3, Impulse(0.1, 0));
let pulses = Rcd(trig, rotate, 0, div, spread, 0, 0, 0, 1);
let oscs = SinOsc(freqs, 0) * pulses * amps;
let out = Splay2(oscs.rotatedLeft(3) * 0.5);
out + (CombN(out, 2, [2, 1], 3) * 0.3)
