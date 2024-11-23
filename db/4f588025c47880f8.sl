/* Rcd ; rotation */
let freqs = 1:8 * 100;
let decays = 8 / 1:8;
let trig = LfPulse(5, 0, 0.005);
let rotate = LfNoise0(0.3) * 8 + 8;
let reset = 0;
let spread = 1;
let metronome = Ringz(trig, 6000, 0.01) * 0.03;
let pulses = Rcd(trig, rotate, reset, 3, spread, 0, 0, 0, 0);
let out = Ringz(pulses, freqs, decays) * 0.05;
Splay2(out * 0.7).Tanh + metronome
