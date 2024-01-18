{- https://sccode.org/1-4Qy ; f0 ; 0333 ; Splay/Stereo -}
(0 .. 7).collect { :i |
	let b = i + 2 * 99;
	let f = SinOscFb(i + 1 / 150, 0).RoundTo(1) + 1 + i * 99 + SinOscFb([3, 2], 0);
	(Formant(f, b, b) * SinOscFb(i + 1 / 130, 0).Max(0)).Tanh
}.Sum.Splay / 7
