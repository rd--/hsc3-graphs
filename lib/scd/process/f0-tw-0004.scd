// https://sccode.org/1-4Qy ; tweet0004
{
	{
		var z = 20.rand + 6;
		var x = {
			var y = LFTri.ar(z, 0).abs / 9 / z;
			(RLPF.ar(TDuty.ar(y, 0, y, 0, 0), z * 600, 0.06) * 9).dup(2)
		}.play(fadeTime: z);
		(26 - z).wait;
		x.release
	}.loop
}.fork

//---- https://sccode.org/1-4Qy ; tweet0004
r{loop{z=20.rand+6;x={y=LFTri.ar(z).abs/9/z;RLPF.ar(TDuty.ar(y,0,y),z*600,0.06,9)!2}.play(s,0,z);wait(26-z);x.release}}.play//#SuperCollider
