// https://sccode.org/1-4Qy ; tweet0005 ; texture variant (rd)
OverlapTexture({ | tr |
	var z = TRand.kr(1, 60, tr);
	var y = LFTri.ar(z, 0).abs / z;
	(RLPF.ar(TDuty.ar(y, 0, y, 0, 0), z * 99 + y, 0.01) * (6 + y)).dup(2)
}, 1, 25, 4)
