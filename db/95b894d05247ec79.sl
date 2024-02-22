{- http://sccode.org/1-4Qy (F0) ; 0288 -}
let b = [1 .. 4];
let c = b + 8;
let f = SelectX(
	SinOscFb(0.1, 0) % (SinOscFb(b, 0)) * c,
	Dc(':.UODD.Ed'.ascii.asList.MidiCps)
);
SinOscFb(f, SinOscFb(1 / c, 0)).Splay / 3
