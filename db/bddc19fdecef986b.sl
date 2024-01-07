(* 20061027 ; rd *)
let h0 = {
	let a = LfNoise0(1) * 0.2 + 1.2;
	let b = LfNoise0(1) * 0.15 + 0.15;
	let f = 40;
	let h = HenonN([f, f * 0.5], a, b, 0, 0);
	Saw(h * 3200 + 1600) * 0.35
 };
let h1 = {
	let n0 = LfNoise0(32);
	let n1 = LfNoise0(2);
	let a = MouseX(1.2, 1.4, 0, 0.1);
	let b = MouseY(0.2, 0.3, 0, 0.1);
	let h = n0.Range(1, 32);
	let p = n1.Range(2400, 3200);
	let l = n1.Range(-0.75, 0.75);
	let g = n1.Range(0.55, 0.85);
	let f = 40;
	let o = Blip(HenonN(f, a, b, 0, 0).Range(p, p * 2), h);
	EqPan(o, l) * g * 0.35
 };
h0() + h1()
