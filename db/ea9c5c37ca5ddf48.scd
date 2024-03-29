// THX sound simulation by Geirmund Simonsen
var freqArray = [77, 74, 72, 70, 65, 62, 60, 58, 53, 50, 46, 34].midicps;
var randomFreq = EnvGen.kr(Env([1, 1, 0.007], [8, 6], [0, -4], 0, 0, 0), 1, 1, 0, 1, 0);
var ampEnv = EnvGen.kr(Env([0.07, 0.07, 0.21], [8, 6], [0, 1], 0, 0, 0), 1, 1, 0, 1, 0);
freqArray.collect({
	arg item;
	var freq = (LFNoise2.kr(1.3, 100, 230) * randomFreq) + EnvGen.kr(Env([0, 0, item], [8, 6], [0, -3], 0, 0, 0), 1, 1, 0, 1, 0);
	Pan2.ar(Saw.ar(freq), LFNoise2.kr(1.3), 1)
}).sum * ampEnv * 0.25
