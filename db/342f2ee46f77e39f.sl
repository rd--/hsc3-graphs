RingzBank(
	Decay(Impulse(4, 0), 0.03) * ClipNoise() * 0.005,
	{ Rand(800, 4000) } ! 12,
	nil,
	{ Rand(0.1, 2) } ! 12
)
