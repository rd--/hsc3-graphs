// https://sccode.org/1-4Qy ; f0 ; 0003
{
	var x = {
		var t = SinOsc.ar(999.rand, 0).abs;
		Formlet.ar(TDuty.ar(t, 0, t, 0, 0), 4000.linrand, t, 1 - t).dup(2)
	}.play;
	(9.rand + 1).wait;
	x.release(39)
}.loop

//----tweet0003
r{loop{x=play{t=SinOsc.ar(999.rand).abs;Formlet.ar(TDuty.ar(t,0,t),4e3.linrand,t,1-t)!2};wait(9.rand+1);x.release(39)}}.play
