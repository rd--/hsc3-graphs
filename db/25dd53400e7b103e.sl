{- https://twitter.com/redFrik/status/1590835403157688320 -}
let b = [1 .. 9];
let g = 1 / b / 99;
let z = Latch(
	WhiteNoise().RoundTo(0.5) + 2,
	BrownNoise() + 1.4 > SinOsc(b / 999, 0)
);
let r = Rlpf(
	z,
	9 ^ SinOsc(g * 9, 0) * 999,
	SinOsc(b / 77, 0) / 2 + 0.6
);
let x = SinOsc(999 * b.scramble / r, 0);
let w = Latch(
	WhiteNoise(),
	BrownNoise() + 1.3 > SinOsc(b / 99, 0)
);
let y = Rlpf(
	w,
	9 ^ SinOsc(g, 0) * 999,
	SinOsc(b / 88, 0) / 2 + 0.6
);
Splay(7 ^ SinOsc(g, 0) / 9 * x * y)
