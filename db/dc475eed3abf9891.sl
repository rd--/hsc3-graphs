{- http://sccode.org/1-4Qy (F0) ; 0320 -}
let b = [2 4 9 3] * 9;
let o = VarSaw(
	VarSaw(1 / b, 0, 0.5) > 0 + 3 * b,
	0,
	Lag(VarSaw(b / 2000, 0, 0.5) + 1 / 2, 1)
);
CombC(o, 1.1, (VarSaw(8 / b, 0, 0.5) % 1).RoundTo(1) + 0.1, 8).Splay / 3
