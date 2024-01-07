(* Vosim *)
let p = TRand(0, 1, Impulse([3, 7], 0));
let tr = Impulse([9, 27] * (1 + (p > 0.95)), 0);
let f = TRand([40, 120, 220], [440, 990, 880], tr);
let n = TRand(2, [4, 8, 12], tr);
let d = TRand([0.2, 0.4, 0.6], [0.6, 0.8, 1], tr);
let a = TRand(0, [0.2, 0.6, 1], tr);
let l = TRand(-1, 1, tr);
let x = MouseX(0.25, 2, 0, 0.2);
let y = MouseY(0.25, 0.85, 0, 0.2);
let z = 9;
let freq = f * x * LinLin(LfNoise2(z), -1, 1, 0.25, 2);
let decay = d * y * LinLin(LfNoise2(z), -1, 1, 0.25, 2);
EqPan2(
	(Vosim(tr, freq, n, decay) * a).Sum,
	l
).Mix * 0.25
