(* https://twitter.com/alln4tural/status/99846300173991936 ; graph rewrite *)
{ :tr |
	var h = TChoose(tr, [33 38 40]).MidiCps * (2 ^ TChoose(tr, [0 .. 5]));
	{
		SinOsc(TExpRand(h - (h / 256), h + (h / 256), tr), 0) * 0.025
	} !^ 64
}.OverlapTexture(1, 9, 5).Mix
