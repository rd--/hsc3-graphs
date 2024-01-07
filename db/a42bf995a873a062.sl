(* 20061028 ; rd *)
let x = MouseX(20, 22000, 0, [0.005, 0.025]);
let y = MouseY(20, 22000, 0, [0.005, 0.075]);
{
	let a = SinOsc(x + LfNoise0([5, 9]), 0);
	let b = SinOsc(y, 0);
	a * b
} !+ 3 * 0.35
