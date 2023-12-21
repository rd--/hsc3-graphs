(* Mix ; !> is ! then Mix *)
{
	EqPan2(
		SinOsc(Rand(22, 333), 0),
		Rand(-1, 1)
	) * Rand(0.01, 0.05)
} !> 9
