{- 20060911 ; rd -}
let t = Impulse(22, 0) * (SinOsc(0.5, 0) + 1);
let x = MouseX(0.005, 0.12, 1, 0.1);
let y = MouseY(0.01, 0.52, 1, 0.1);
let z = {
	let n1 = LfNoise0(2);
	let n2 = CoinGate(0.05 + n1 + (y * 0.4) + (t * 0.5), t * 0.5);
	let n3 = TExpRand([500, 900], 1600, t);
	Ringz(n2, n3, x)
} !> 3;
z.Clip2(TRand(0, 1, Dust(8))) * 0.25
