{- Sequencer ; audio rate -}
let freq = Sequencer([60 62 65 69], Impulse(2, 0)).MidiCps;
SinOsc(freq, 0) * 0.1
