/* Saw ; Method chaining notation */
Saw(
	SinOsc(0.2, 0)
	.LinLin(-1, 1, [200 300 400], [600 700 800])
	.Latch(Impulse([2 6], 0))
).Sum.Mul(
	Impulse([2 3], 0)
	.Perc(0.01, 0.04, -4)
	.Lag(10)
).Lpf(
	SinOsc(0.1, 0)
	.LinLin(-1, 1, 500, 700)
)
