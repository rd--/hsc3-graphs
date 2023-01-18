// pulse harmonic warbulence (jmcc) #12
Texture.overlapRoutine({
	var f = Rand.ir(24, 96).midicps;
	var r = XLine.kr(ExpRand.ir(0.1, 20), ExpRand.ir(0.1, 20), 25.6);
	var n = 12;
	var p = LFPulse.kr(ExpRand.ir(0.2, 1.2), Rand.ir(0.1, 0.2), 0.5);
	Mix.arFill(n, {
		arg i;
		var m = (SinOsc.kr(r * Rand.ir(0.9, 1.1), Rand.ir(0, 2 * pi)) * 0.1 - 0.05).max(0);
		Pan2.ar(SinOsc.ar(f * i + f, 0) * m * (1 / (i + 1)), Rand.ir(-1, 1), 1)
	}) * p
}, 12.8, 6.4, 6, 2, inf, { arg z ;
	Mix.arFill(5, { CombN.ar(z, 0.3, { Rand.ir(0.1, 0.3) }.dup, 8) }) * 0.5
}, 0)
