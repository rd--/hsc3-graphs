{- TLine ; https://scsynth.org/t/6371/12 -}
let x = MouseX(10, 100, 1, 0.2);
let y = MouseY(0.01, 0.05, 1, 0.2);
{
	let i = Impulse(x + (x * LfNoise2(0.1) * 0.1), 0);
	let m = TRand(0.95, 1.05, i);
	let t = TLine(-1.5, 1.5, 0.01 * m, i);
	let c = ((10 * (2 * pi * 5 * t).Cos) + (5 * (2 * pi * 40 * t).Cos)) * (pi.negated * t.Squared).Exp;
	c * y
} ! 2
