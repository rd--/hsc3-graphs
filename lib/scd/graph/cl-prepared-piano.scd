// prepared just piano ; colby leider ; modified by jmcc ; graph rewrite
var c = 4; // number of combs
var a = 4;	// number of allpasses
var v = 3; // number of overlapped voices
OverlapTexture({ |tr|
	var y;
	y = Dust.ar(MouseX.kr(0.1, 4, 1, 0.2)) * 0.4;
	y = Resonz.ar(y, 400, 0.4);
	y = LPF.ar(y, 12000);
	y = Integrator.ar(y, 0.99);
	y = HPF.ar(y, 200);
	y = {
		CombL.ar(
			y,
			0.1,
			TRand.kr(1, 8, tr) / TRand.kr(1, 9, tr) * 0.001, // Partch tonality diamond about 1000Hz
			5
		)
	}.dup(c).sum;
	a.do({
		y = AllpassN.ar(y, 0.040, { TRand.kr(0, 0.040, tr) }.dup(2), 8)
	});
	y
}, 5, 3, v)
