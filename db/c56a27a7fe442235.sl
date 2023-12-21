(* Worth experimenting with *)
var tr = Dust(3 / 7);
var f0 = Rand(100, 400);
(1 .. 16).collect { :partial |
	var env = Asr(tr, 0, 5, [0]) / partial;
	var amp = LfNoise1(Rand(5, 12)).Max(0);
	Pan2(SinOsc(f0 * partial, 0), 1.Rand2, env * amp)
}.Mix * 0.5
