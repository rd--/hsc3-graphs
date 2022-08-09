// https://sccode.org/1-4Qy ; f0 ; 0252
inf.do({
	arg i;
	{
		var e = Line.ar(0, pi, 10, doneAction: 2).sin;
		MoogFF.ar(SyncSaw.ar([7, 8], ([5, 10, 12, 20, 24] * 10).wrapAt((i * 2))), 4000 * e, 2, 0) * e / 3
	}.play;
	1.wait
})

//----tweet0252
r{inf.do{|i|play{MoogFF.ar(SyncSaw.ar([7,8],[5,10,12,20,24]*10@@(i*2)),4e3*e=Line.ar(0,pi,10,1,0,2).sin)*e/3};1.wait}}.play
