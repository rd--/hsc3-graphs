{- Rcd ; auto-reset off -}
let freqs = 1:8 * 100;
let decays = 1 / 1:8;
let clock = LfPulse(8, 0, 0.001);
let rotate = 7;
let spread = 1;
let pulses = Rcd(clock, rotate, 0, 0, spread, 0, 0, 0, 0);
let out = Ringz(pulses, freqs, decays) * 0.05;
Splay2(out)
