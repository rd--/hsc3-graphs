(* http://earslap.com/weblog/music-release-laconicism.html *)
var snd = Hpf(
	Pulse([[0.1, 0.11], [0.12, 0.13]], 0.6) * 0.005,
	99
);
Hpf(
	MidEq(
		Limiter(GVerb(snd, [[1, 5 / 4], [1.5, 2]], 99, 0.5, 0.5, 15, 1, 0,7, 0.5) * 300, 1, 0.01) * 0.1,
		9000,
		0.9,
		9
	),
	200
).Sum.transposed.Mix
