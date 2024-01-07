(* Worth experimenting with *)
let tr = Dust(3 / 7);
let f0 = Rand(100, 400);
(1 .. 16).collect { :partial |
	let env = Asr(tr, 0, 5, [0]) / partial;
	let amp = LfNoise1(Rand(5, 12)).Max(0);
	Pan2(SinOsc(f0 * partial, 0), 1.Rand2, env * amp)
}.Mix * 0.5
