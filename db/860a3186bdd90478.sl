/* Max */
SinOsc(
	XLine([100 200], [400 100], 2).reduce { :i :j | i.Max(j) },
	0
) * 0.1
