(* SinOsc ; http://earslap.com/article/combination-tones-and-the-nonlinearities-of-the-human-ear.html *)
var freqSweep = Line(4000, 1000, 10);
SinOsc([freqSweep, freqSweep + 400], 0).mean
