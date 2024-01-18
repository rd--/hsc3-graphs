// noise modulated sawtooths (jmcc) #6
{
	var f = (60 + 40.rand).midicps;
	var z = LFSaw.ar([f, f + 0.2], 0) * LFNoise2.kr(f * [0.15, 0.16]) * 0.1;
	CombN.ar(z, 0.5, 0.5, 4) + z.reverse
}.overlap(4, 4, 4)

 // noise modulated sawtooths (jmcc) #6
Texture.overlapRoutine({
	var f = (60 + 40.rand).midicps;
	LFSaw.ar([f, f + 0.2], 0) * LFNoise2.kr(f * [0.15, 0.16]) * 0.1
}, 4, 4, 4, postProcess: {
	arg z;
	CombN.ar(z, 0.5, 0.5, 4, 1) + z.reverse
})
