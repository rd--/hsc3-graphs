;; clustered sines ; jmcc #2 ; graph rewrite
var n = 80;
OverlapTexture({ :tr |
	var f1 = TRand(100, 1100, tr);
	var f2 = 4.0 * f1;
	var fn = {
		var y = f1 + TRand(0, f2, tr);
		SinOsc(y, 0) * f1 / y
	};
	{ fn !+ n } ! 2 * 0.1 / n;
}, 4, 4, 3)
