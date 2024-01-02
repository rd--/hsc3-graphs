(* Dc ; Silence at first eight channels, random sine tones at next eight *)
{ :tr |
	var p = { Dc(0) } ! 8;
	var q = { SinOsc(TRand(220, 880, tr), 0) } ! 8;
	(p ++ q) * 0.1
}.OverlapTexture(2, 5, 2).Sum