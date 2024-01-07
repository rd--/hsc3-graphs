(* Strummable metals ; use mouse to strum strings ; Jmcc *)
let mouseX = MouseX(0, 1, 0, 0.2);
let strings = (1 .. 8).collect { :i |
	let trigger = Hpz1(mouseX > (0.25 + (i * 0.07))).Abs;
	let pluck = PinkNoise() * Decay(trigger, 0.05).kr * 0.04;
	let n = 15;
	EqPan2(
		RingzBank(
			pluck,
			{ 300 * i + LinRand(0, 8000, 0) } ! n,
			nil,
			{ Rand(1, 4) } ! n
		),
		i * 0.2 - 0.5
	)
}.Sum;
LeakDc(
	Lpf(strings, 12000),
	0.995
)
