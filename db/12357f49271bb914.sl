{- Slew -}
let x = MouseX(200, 12000, 1, 0.2);
let y = MouseY(200, 12000, 1, 0.2);
[
	Slew (Saw(440).Neg, x, y) * 0.05,
	Slew(LfPulse(800, 0, 0.5), x, y) * 0.1
]
