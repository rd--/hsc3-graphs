// tremulate (jmcc) #1
Texture.xfadeRoutine({
	var f = 500 + 400.rand;
	var r = 30 + 60.rand;
	var o = FSinOsc.ar(f * [1.0, 1.2, 1.5, 1.8], 0);
	var a = 0.max(LFNoise2.kr(r ! 4) * 0.1);
	var l = { 1.0.rand2 } ! 4;
	Mix.ar(Pan2.ar(o * a, l, 1))
}, 2, 0.5, postProcess: {
	arg z;
	CombN.ar(z, 0.1, 0.1, 1)
})
