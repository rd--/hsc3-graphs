// https://sccode.org/1-4Qy ; tweet0001
{
	0.to(98).do({
		arg i = 0;
		var x = {
			var ph = SinOsc.ar((i % 9).div(3) * 100 + (i % 9) + 500, 0);
			var e = LinSeg(1, [0, i * 2, 0, 0.01, 1, 2, 1, 25, 0]);
			Pan2.ar(SinOsc.ar(i + 1, ph, 0.03), 1.0.rand2, 1) * e
		}.play;
		2.wait;
		x.release(25)
	})
}.fork

//----tweet0001
r{99.do{|i|x={Pan2.ar(SinOsc.ar(i+1,SinOsc.ar((i%9).div(3)*100+(i%9)+500),0.03),1.0.rand2)}.play;2.wait;x.release(25)}}.play
