(* https://sccode.org/1-4Qy ; f0 ; 0238 *)
let b = [7 6 5 4];
let c = LfCub(b / 99, 0) % 1 / 50;
let o = Formlet(
	Logistic(3.9, b, 0.5),
	LfCub(b, 0) + LfCub(b / 7, 0) * 800 + 999,
	c,
	c * 2
) / 9;
Limiter(o, 1, 0.01).Splay
