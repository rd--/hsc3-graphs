// prepared just piano ; colby leider ; modified by jmcc
var c = 4; // number of combs
var a = 4;	// number of allpasses
var v = 3; // number of overlapped voices
{
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
			(7.rand + 1) / (8.rand + 1) * 0.001, // Partch tonality diamond about 1000Hz
			5
		)
	}.dup(c).sum;
	a.do({
		y = AllpassN.ar(y, 0.040, [0.040.rand,0.040.rand], 8)
	});
	y
}.overlap(5, 3, v)
