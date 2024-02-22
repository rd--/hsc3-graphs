// Inharmonic warbulence ; Jmcc ; graph rewrite (Rd)
var z = OverlapTexture({
        arg tr;
		var f, r, n, a, z;
		f = TRand.kr(24, 96, tr).midicps;
		a = min(1, (500/f));
		r = TxLine.kr(TExpRand.kr(0.1,20,tr),TExpRand.kr(0.1,20,tr), 25.6, tr);
		n = 12;
		a * Mix.arFill(n, { arg i;
			g = TRand.kr(0,n,tr) + 1;
			Pan2.ar(
				FSinOsc.ar(f*g, 0, SinOsc.kr( r * TRand.kr(0.9,1.1,tr),TRand.kr(0,2pi,tr),0.08,-0.04).max(0)) * (2/g),
				TRand.kr(-1,1,tr)
			)
		}) * 0.1}, 12.8, 6.4, 6, 2);
Mix.arFill(5, { CombN.ar(z, 0.3, [Rand(0.1,0.3),Rand(0.1,0.3)], 8) }) * 0.3;
