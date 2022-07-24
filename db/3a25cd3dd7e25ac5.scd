// sin ; https://scsynth.org/t/6256/7 ; sinusoid with a variable-slope ramp phase
var freq = 130;
var width = LFTri.ar(0.1, 0).linlin(-1, 1, 0.01, 0.99);
var phasor = Phasor.ar(0, freq * SampleDur.ir, width.neg, 1 - width, width.neg, 0);
phasor = phasor.bilin(0, width.neg, 1 - width, 0, -0.5, 1);
phasor = Select.ar(phasor > 0, [0.5 + phasor, phasor]);
(phasor * 2 * pi).sin * 0.1
