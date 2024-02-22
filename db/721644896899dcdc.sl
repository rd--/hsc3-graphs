{- Rcd ; using 'reset' -}
let clock = LfPulse(8, 0, 0.001);
let freqs = (0:7 * 4 + 50).MidiCps;
let rotate = 4;
let reset = CoinGate(0.05, clock);
let pulses = Rcd(clock, rotate, reset, 0, 0, 0, 0, 0, 0);
let out = Ringz(pulses, freqs, [1, 1, 0.5, 0.2, 0.2, 0.3, 0.5, 1]) * 0.05;
Splay2(out)
