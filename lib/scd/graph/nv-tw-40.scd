// https://swiki.hfbk-hamburg.de/MusicTechnology/899 (nv) [Line 40]
var f = { |i|
	var t = 0.6 ** i * 40 * Impulse.ar(2 ** i / 32, 1 / 2);
	var f = 4 ** LFNoise0.kr(1 / 16) * 300;
	RLPF.ar(t, f, 0.005).sin
};
var x = Splay.ar((0 .. 8).collect(f));
2.do {
	x = FreeVerb2.ar(x[0], x[1], 0.1, 1, 1)
};
x

//---- https://swiki.hfbk-hamburg.de/MusicTechnology/899 (nv) [Line 40] ; keywords
var f = { |i|
	var t = 0.6 ** i * 40 * Impulse.ar(freq: 2 ** i / 32, phase: 1 / 2);
	var f = 4 ** LFNoise0.kr(freq: 1 / 16) * 300;
	RLPF.ar(in: t, freq: f, rq: 0.005).sin
};
var x = Splay.ar(inArray: (0 .. 7).collect(f), spread: 1, level: 1, center: 0, levelComp: true);
2.do {
	x = FreeVerb2.ar(x[0], x[1], 0.1, 1, 1)
};
x
