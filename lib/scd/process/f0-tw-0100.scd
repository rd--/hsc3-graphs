// https://sccode.org/1-4Qy ; f0 ; 0100
{
	{
		var z = 1.rrand(9) * 99;
		var a = DelayN.ar(LPF.ar(InFeedback.ar(0, 2), z), 0.2, 0.2);
		Release.ar(SinOsc.ar(z + [0, 3], a * pi) / 2, 0, 6, 9)
	}.play;
	6.wait;
}.loop

//----tweet0100
r{loop{x=play{a=DelayN.ar(LPF.ar(InFeedback.ar(0,2),z=1.rrand(9)*99));SinOsc.ar(z+[0,3],a*pi)/2};6.wait;x.release(9)}}.play
