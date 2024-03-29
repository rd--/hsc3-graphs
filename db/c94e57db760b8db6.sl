{- http://sccode.org/1-4Qy (F0) ; 0299 -}
let c = 3 ^ LfSaw([2, 3], [0, 1]);
let p = Formant(
	LfSaw(1 / 16, 0).RoundTo(c) + 3 * 33 * c.Ceiling,
	3 ^ Lag(c, 0.1) * 66,
	3 ^ c * 99
);
let q = Formant(c + 3, 1 - c * 3000, 880);
p * q / 3
