(* dark sea horns (jl) *)
let x = LocalIn(2, 0);
let a = (SinOsc(65, x * LfNoise1(0.1) * 3) * LfNoise1(3) * 6).Tanh;
9.timesRepeat {
	a := AllpassL(a, 0.3, { 0.2.Rand0 + 0.1 } ! 2, 5)
};
a := a.Tanh;
(a * 0.1) <! LocalOut(a)
