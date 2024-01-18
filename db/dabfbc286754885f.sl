{- Formlet -}
let amp = LfPulse(0.5, 0, 0.5);
let my = MouseY(400, 3200, 0, 0.2);
{
	let x = Formlet({ Dust(12) } ! 2 * 0.05 * amp, my * ExpRand(0.5, 2), 0.005, 0.1);
	AllpassN(x, 0.05, 0.05.Rand0, 8)
} !+ 8
