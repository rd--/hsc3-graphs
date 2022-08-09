// https://sccode.org/1-4Qy ; f0 ; 0081
{
	var t = 3.0.linrand;
	{
		var e = { XLine.ar(1.0.rand, 0.5.rand, t) }.dup(2);
		e * SinOsc.ar(XLine.ar(999.rand + 99, 999.rand, t, 1, 0, 2), 0)
	}.play;
	t.wait
}.loop

//----tweet0081
fork{inf.do{t=3.0.linrand;play{{XLine.ar(1.0.rand,0.5.rand,t)}!2*SinOsc.ar(XLine.ar(999.rand+99,999.rand,t,1,0,2))};t.wait}}
