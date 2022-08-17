// MiVerb ; stereo ; with freezing
var imp = Dust.ar([0.7, 0.8]);
var freq = Latch.ar(PinkNoise.ar(24,80), imp).midicps;
var input = RLPF.ar(imp, freq, 0.002, 3);
var freez = TRand.kr(-1, 1, Dust.kr(0.7));
var revtime = 0.8;
var drywet = 0.5;
var damping = 0.3;
var diff = LFNoise1.kr(0.1,0.5,0.5);
MiVerb.ar(input, revtime, drywet, damping, freeze: freez)
