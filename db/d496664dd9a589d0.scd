// MVerb
var freq = [1, 2.1, 2.9].collect({ arg item; item * 1000 });
var src = Resonz({ Dust([0.25, 0.5]) }.dup(3), freq, 0.01).sum * 10;
var noiseIn = { arg min, max; LinLin.kr(LFNoise2.kr(1), -1, 1, min, max) };
var dampingFreq = 0.1;
var density = noiseIn.value(0.1, 0.9);
var bandwidthFreq = noiseIn.value(0.1, 0.9);
var decay = noiseIn.value(0.1, 0.9);
var predelay = 0.1;
var size = 0.9;
var gain = 1;
var mix = noiseIn.value(0.1, 0.9);
var earlyMix = noiseIn.value(0.1, 0.9);
MVerb.ar(src[0], src[1], dampingFreq, density, bandwidthFreq, decay, predelay, size, gain, mix, earlyMix)