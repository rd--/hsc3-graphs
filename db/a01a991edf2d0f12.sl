{- https://sonomu.club/@lukiss/111577779507616435 ; Dec 14, 2023 -}
let r = { :a :b |
	let t = HenonL(LfNoise2(1).ExpRange(0.01, 1) * 16, 1.4, 0.3, 0, 0);
	TRand(a, b, t)
};
let t = Sweep(0, r(-1E3, 1E3)) % r(28, 512);
let b = t.BitAnd(r(64, 256)).BitOr(t.ShiftRight(r(4, 18)));
LeakDc(
	0.5 * LfTri(b.MidiCps % 1E4, 0) * (b > 32).Lag3(0.1),
	0.995
) # 2
