{- Scm -}
let tick = LfPulse(3.1, 0, 0.5);
let rotate = LfNoise0(0.3) * 3.5 + 3.5;
let pulses = Scm(0, 80, rotate, 100, 40, 100, 3);
let freqs = [60, 67, 72, 75, 79, 81, 84, 86].MidiCps;
let out = Ringz(pulses, freqs, 0.08);
Splay2(out)
