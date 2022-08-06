// https://sccode.org/1-4Qy ; tweet0005 ; texture variant (rd)
OverlapTexture({
	arg tr;
	var z = TRand.kr(1, 60, tr);
	var y = LFTri.ar(z, 0).abs / z;
	(RLPF.ar(TDuty.ar(y, 0, y, 0, 0), z * 99 + y, 0.01) * (6 + y)).dup(2)
}, 1, 25, 4)

//---- https://sccode.org/1-4Qy ; tweet0005
r{loop{z=60.rand+1;x={y=LFTri.ar(z).abs/z;RLPF.ar(TDuty.ar(y,0,y),z*99+y,0.01,6+y)!2}.play(s,0,z);wait(z/3);x.release}}.play
