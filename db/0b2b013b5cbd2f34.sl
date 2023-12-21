(* SinOscFb ; OverlapTexture *)
{ :tr |
	var x = MouseX(0.15, 0.85, 0, 0.2);
	var f0 = Choose(tr, [110, 220, 440]);
	{
		var freq = f0 + TRand(0, f0, tr);
		var fb = LinLin(LfNoise2(1), -1, 1, 0, x);
		SinOscFb(freq, fb) * 0.1
	} ! 16
}.OverlapTexture(2, 6, 3).Mix
