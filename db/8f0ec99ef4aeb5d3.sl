{- https://www.youtube.com/watch?v=mKbRuL41uR0 ; lnu -}
let f = 40 * (1, 3 .. 33);
let c = LatoocarfianL(4, 1, 3, 0.5, 0.5, 0.5, 0.5).ExpRange(0.01, 1).HanWindow * 8;
let t = 2 ^ (LatoocarfianL(c, 1, 3, 0.5, 0.5, 0.5, 0.5) * 2 + 1).Ceiling;
let e = (LfSaw(-1 * t, 1) * 1 + 1 / 2 ^ t).Lag3(0.005);
let d = LatoocarfianL(t ^ t * (f / f.sum), 1, 3, 0.5, 0.5, 0.5, 0.5).Tanh.ExpRange(0.01, 1) * (t ^ 2 );
let g = ((LfSaw(-1 * e ^ t, 1) * f.Log2) * d * e).Sin.Abs;
Splay(
	Bpf(
		LfSaw(f + (LfPulse(f * 8, 1, 1 - (e)) / 2 ^ (t * 2) * f * t), 0) ^ (e ^ 2 * (t + t)),
		g * (e ^ (t / 8) * 11000) + 40,
		1.2 - e
	),
	t.Sin
).Tanh / 4
