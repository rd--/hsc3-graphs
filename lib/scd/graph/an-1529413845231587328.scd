// https://twitter.com/alln4tural/status/1529413845231587328 (an)
(0 .. 31).collect({ arg k;
	(0 .. 7).collect({ arg i;
		var ph = [
			SinOsc.ar(i * k ** i / { (2 ** (-2 .. 4)).choose } ! 3, 0),
			Decay.kr(Dust.kr(1 / 4 ** i), SinOsc.ar(0.1, 0) + k + i),
			k * 999
		].product;
		SinOsc.ar(i * k * k, ph)
	}).product
}).sum
