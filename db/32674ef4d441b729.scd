// http://earslap.com/article/combination-tones-and-the-nonlinearities-of-the-human-ear.html
var times = Dseq.dr(((1.dup(12) ++ [1.5, 0.5, 2]).dup(2)).flat / 2, 1);
var pitchBase = [55, 55, 56, 58, 58, 56, 55, 53, 51, 51, 53, 55];
var pitches = Dseq.dr((pitchBase ++ [55, 53, 53] ++ pitchBase ++ [53, 51, 51]).midiCps, 1);
var freqs = Duty.ar(times, 0, pitches, 2);
var baseRandFreq = TRand.ar(1000, 2000, Impulse.ar(32, 0)).lag(0.01);
SinOsc.ar([baseRandFreq, baseRandFreq + freqs], 0).mean
