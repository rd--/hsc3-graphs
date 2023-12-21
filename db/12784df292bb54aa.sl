(* http://earslap.com/article/sctweeting.html *)
AllpassC(
	SinOsc(55, 0).Tanh,
	0.4,
	TExpRand(0.0002, 0.4, Impulse(8, 0)).RoundTo([0.002, 0.0004]),
	2
)
