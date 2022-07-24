// sin ; https://scsynth.org/t/6256/7 ; sinusoid with a variable-slope Triangular Phase
var freq = 130;
var width = LFTri.ar(0.1, 0).linlin(-1, 1, 0.01, 0.99);
var phasor = Phasor.ar(0, freq * SampleDur.ir, width.neg, 1 - width, 0);
phasor = phasor.bilin(0, width.neg, 1 - width, 0, -1, 1);
phasor = (phasor.abs * 1.5).wrap(0,1);
(phasor * 2 * pi).sin * 0.1
