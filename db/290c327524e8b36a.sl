let f = LfNoise2([2 3]) * [333 222] + [222 333];
SinOsc(f.CpsMidi.RoundTo([2 3]).Lag(1E-2).MidiCps, 0) * 0.1
