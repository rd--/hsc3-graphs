;; Rcd  ; using 'reset'
var clock = LfPulse(8, 0, 0.001);
var freqs = (0 .. 7).collect { :i | (i * 4 + 50).MidiCps };
var rotate = 4;
var reset = CoinGate(0.05, clock);
var pulses = Rcd(clock, rotate, reset, 0, 0, 0, 0, 0, 0);
var out = Ringz(pulses, freqs, [1, 1, 0.5, 0.2, 0.2, 0.3, 0.5, 1]) * 0.05;
Splay2(out)
