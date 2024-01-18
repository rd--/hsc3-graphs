// https://twitter.com/redFrik/status/1319946903711338496
inf.do {
	arg i;
	var d = (1 .. 9).choose;
	var w = d * 9 + 3;
	var a = {
		var c = [0, 0.804, 1.944, 3.084, 3.888, 5.028, 5.832, 6.972, 7.776, 8.916, 10.056, 10.86];
		var z = {
			var f = LFTri.kr(1 / 99, 0) * 9 + (12 * (3 ..6).choose + c.at([0, 2, 3, 5, 7, 8, 10].choose)).midicps;
			var y = SinOscFB.ar(f, LFTri.kr(1 + i / 50, 0) + 1 / 2);
			Pan2.ar(y, LFTri.kr(i / 70, 0), 1 / 2)
		}.dup(d).sum;
		Release.ar(CombN.ar(z, 0.2, 0.2, 1).tanh * 0.1, w, 0, 12)
	}.play;
	w.seconds.wait
}

//---- calculations
Scale.minor.tuning_(Tuning.mean5).tuning.tuning == [0, 0.804, 1.944, 3.084, 3.888, 5.028, 5.832, 6.972, 7.776, 8.916, 10.056, 10.86]

//----
fork{inf.do{a={|i|c=Scale.minor.tuning_(Tuning.mean5);z=sum({ar(Pan2,ar(SinOscFB,kr(o=LFTri,1/99)*9+midicps(12*(3..6).choose+c[c.degrees.choose]),kr(o,1+i/50)+1/2),kr(o,i/70))/2}!d=9.rand);ar(CombN,z).tanh}.play(s,0,9);wait(d*9+3);a.release(12)}}