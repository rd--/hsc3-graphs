// https://sccode.org/1-4Qy ; f0 ; 0004
{
	var z = 20.rand + 6;
	var d = 26 - z;
	{
		var y = LFTri.ar(z, 0).abs / 9 / z;
		Release.ar(Pan2.ar(RLPF.ar(TDuty.ar(y, 0, y, 0, 0), z * 600, 0.06), 0, 9) * 0.5, d, 0, z)
	}.play;
	d.seconds.wait;
}.loop

//---- https://sccode.org/1-4Qy ; tweet0004
r{loop{z=20.rand+6;x={y=LFTri.ar(z).abs/9/z;RLPF.ar(TDuty.ar(y,0,y),z*600,0.06,9)!2}.play(s,0,z);wait(26-z);x.release}}.play//#SuperCollider
