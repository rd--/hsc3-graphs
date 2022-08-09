// https://sccode.org/1-4Qy ; f0 ; 0005
{
	var z = 60.rand + 1;
	var x = {
		var y = LFTri.ar(z, 0).abs / z;
		(RLPF.ar(TDuty.ar(y, 0, y, 0, 0), z * 99 + y, 0.01) * (6 + y)).dup(2)
	}.play(fadeTime: z);
	(z / 3).wait;
	x.release
}.loop

//----tweet0005
r{loop{z=60.rand+1;x={y=LFTri.ar(z).abs/z;RLPF.ar(TDuty.ar(y,0,y),z*99+y,0.01,6+y)!2}.play(s,0,z);wait(z/3);x.release}}.play
