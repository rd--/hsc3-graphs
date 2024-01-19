// <https://swiki.hfbk-hamburg.de/MusicTechnology/899> (tw ; tim walters)
var nd = { |k|
	var x = { |f m j|
		SinOsc.ar(f + (m * 4 * j), m) * LFNoise1.ar(j + 1 / f * 4) / 2
	};
	var y = x.value(0.1, 0, 8);
	9.do { |i|
		y = x.value(i * k * [4, 8], y, i)
	};
	y
};
(0 .. 7).collect(nd).sum / 4
