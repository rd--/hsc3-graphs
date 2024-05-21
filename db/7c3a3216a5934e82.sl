{- https://sonomu.club/@lukiss/109875835273563824 ; Feb 17 2023  -}
let f = { :rt | Sweep(0, rt) };
let t = f(4E4);
let c = f(1);
let r = [1 .. 5];
let b = [
	-1 * [24 5 0 10 8 15].MidiRatio * t,
	(r + c).Wrap(1, 3333),
	t.ShiftRight(105)
].reduce(BitAnd:/2);
let e = b.LinCurve(0, 127, -1, 1, -8).Fold2(1) / 2;
Splay(
	FreeVerb(
		LfSaw(-1 * r, 2).Max(0).Lag3(0.1) * LeakDc(e, 0.999),
		1 / 3,
		c.Sin.Max(0),
		LfSaw(c.Cos, 0)
	),
	c.Sin
)
