(* SinOscFb ; OverlapTexture *)
{ :tr |
	let x = MouseX(0.15, 0.85, 0, 0.2);
	let f0 = Choose(tr, [110, 220, 440]);
	{
		let freq = f0 + TRand(0, f0, tr);
		let fb = LinLin(LfNoise2(1), -1, 1, 0, x);
		SinOscFb(freq, fb) * 0.1
	} ! 16
}.OverlapTexture(2, 6, 3).Mix
