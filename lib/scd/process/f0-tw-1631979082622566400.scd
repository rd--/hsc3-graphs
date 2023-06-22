// https://twitter.com/redFrik/status/1631979082622566400 ; f0
{
	inf.do {
		arg i;
		var e = [0, 3.084, 5.028, 6.972, 10.056, 0, 3.084, 5.028, 6.972, 10.056];
		var f = (i.div(60) % 2 * -2 + e.wrapAt(i - i.div(11)) + 70 - (i.div(12) + 1 % 2 * 12)).midicps + [0, 2 / 3];
		var d = i.div(12) % 3 >> 1;
		var c = ((60.midicps / f) ** (1 / 3));
		var n = (d + [1, 1 / 30]).wrapAt(i);
		{
			var a = f * 1.5 ** SinOsc.ar(
				i % 2 * i.div([3, 4]) % 7 % 6 / 4 * 3 / (1 + d),
				[i, i * 2]
			);
			SinOsc.ar(
				SinOsc.ar(f, 0) * a + f,
				0
			) * XLine.ar(0.1, 0.0001, 4 + d, doneAction: 2) * c
		}.play;
		[i, f, d, c, n].postln;
		n.wait
	}
}.fork

//---- https://twitter.com/redFrik/status/1631979082622566400 ; f0
fork{do(inf,{|i|f=midicps(i div:60%2* -2+Scale.yu(\mean5)[i-(i div:11)]+70-(i div:12+1%2*12))+[0,2/3];play{ar(a=SinOsc,f+ar(a,f,0,f*1.5**ar(a,i%2*i div:[3,4]%7%6/4*3/(1+d=i div:12%3>>1),[i,i*2])),0,kr(XLine,0.1,1e-4,4+d,kr(AmpComp,f),0,2))};wait(d+[1,1/30]@@i)})}// #SuperCollider

//---- calculations
(0 .. 9).collect { arg each; Scale.yu(\mean5).at(each) }
