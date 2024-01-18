{- Ping pong -}
let rate = 5;
let tr = Impulse(5, 0);
let freq = TRand([36, 60], [72, 86], tr).MidiCps;
let ratio = 2;
let env = Decay2(tr, 0, 1.25 / rate);
PmOsc(freq, freq * ratio, 3 + env * 4, 0) * env * 0.25
