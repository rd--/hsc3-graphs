{- http://earslap.com/article/combination-tones-and-the-nonlinearities-of-the-human-ear.html -}
let timesBase = 1 # 12 ++ [1.5 0.5 2];
let times = Dseq(inf, (timesBase # 2).concatenation / 2);
let pitchBase = [55 55 56 58 58 56 55 53 51 51 53 55];
let pitches = Dseq(inf, (pitchBase ++ [55 53 53] ++ pitchBase ++ [53 51 51]).MidiCps);
let freqs = Duty(times, 0, pitches);
let baseRandFreq = TRand(1000, 2000, Impulse(32, 0)).Lag(0.01);
SinOsc([baseRandFreq, baseRandFreq + freqs], 0).mean
