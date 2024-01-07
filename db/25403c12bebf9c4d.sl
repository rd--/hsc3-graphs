(* http://earslap.com/weblog/music-release-laconicism.html *)
let tr = Impulse(8, 0) * LfNoise1(2);
CombL(
	(Saw([3, 4]) * Decay(tr, 0.1)).Tanh,
	1,
	TRand(0, 0.01, tr).RoundTo(0.00015),
	TRand(-30, 30, tr)
)
