// https://sonomu.club/@lukiss/111577779507616435
var r = { | a b |
	var t = HenonL.ar(LFNoise2.ar(1).exprange(0.01, 1) * 16, 1.4, 0.3, 0, 0);
	TRand.ar(a, b, t)
};
var t = Sweep.ar(0, r.value(-1E3, 1E3)) % r.value(28, 512);
var b = (t & r.value(64, 256)) | (t >> r.value(4, 18));
LeakDC.ar(
	0.5 * LFTri.ar(b.midicps % 1E4, 0) * (b > 32).lag3(0.1),
	0.995
) ! 2
