// clustered sines ; jmcc #2 ; graph rewrite
var n = 80;
OverlapTexture({ |tr|
	var f1 = TRand.kr(100, 1100, tr);
	var f2 = 4.0 * f1;
	var fn = {
		var y = f1 + TRand.kr(0, f2, tr);
		SinOsc.ar(y, 0) * f1 / y
	}.dup(n).sum;
	{ fn }.dup * 0.1 / n;
}, 4, 4, 3)
