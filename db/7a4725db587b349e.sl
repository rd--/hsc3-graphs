(* Feedback loop ; https://github.com/lukiss/Losers-Union-SC-Research *)
let i = LocalIn(2, [0 0]);
let o = Splay2(
	LeakDc(
		DelayC(
			i + ((1 + i) ^ 0.999),
			1,
			SinOsc(0.01 / (1 .. 8), 0).ExpRange(0.01, 1)
		),
		0.995
	).Tanh
);
Lpf(o, 5000) / 5 <! LocalOut(o)
