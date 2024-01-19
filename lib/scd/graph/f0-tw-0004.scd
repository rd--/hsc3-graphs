// https://sccode.org/1-4Qy ; tweet0004 ; texture variant (rd)
OverlapTexture({ |tr|
	var z = TRand.kr(6, 26, tr);
	var y = LFTri.ar(z, 0).abs / 9 / z;
	(RLPF.ar(TDuty.ar(y, 0, y, 0, 0), z * 600, 0.06) * 9).dup(2)
}, 6, 10, 2)
