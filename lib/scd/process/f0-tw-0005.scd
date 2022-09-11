// https://sccode.org/1-4Qy ; f0 ; 0005
{
	var z = 60.rand + 1;
	var d = z / 3;
	{
		var y = LFTri.ar(z, 0).abs / z;
		Release.ar(Pan2.ar(RLPF.ar(TDuty.ar(y, 0, y, 0, 0), z * 99 + y, 0.01) * (6 + y), 0, 1 / 3), d, 0, z)
	}.play;
	d.seconds.wait;
}.loop

//----tweet0005
r{loop{z=60.rand+1;x={y=LFTri.ar(z).abs/z;RLPF.ar(TDuty.ar(y,0,y),z*99+y,0.01,6+y)!2}.play(s,0,z);wait(z/3);x.release}}.play
