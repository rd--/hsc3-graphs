// https://sccode.org/1-4Qy ; f0 ; 0001
(0 .. 98).do {
	arg i = 0;
	{
		var p = SinOsc.ar((i % 9).div(3) * 100 + (i % 9) + 500, 0);
		Release.ar(Pan2.ar(SinOsc.ar(i + 1, p, 0.03), 1.0.rand2, 1), 0, 2, 25)
	}.play;
	2.seconds.wait;
}

// https://sccode.org/1-4Qy ; f0 ; 0001
(0 .. 98).do({
	arg i = 0;
	var x = {
		var ph = SinOsc.ar((i % 9).div(3) * 100 + (i % 9) + 500, 0);
		Pan2.ar(SinOsc.ar(i + 1, ph, 0.03), 1.0.rand2, 1)
	}.play;
	2.seconds.wait;
	x.release(25)
})

//----tweet0001
r{99.do{|i|x={Pan2.ar(SinOsc.ar(i+1,SinOsc.ar((i%9).div(3)*100+(i%9)+500),0.03),1.0.rand2)}.play;2.wait;x.release(25)}}.play
