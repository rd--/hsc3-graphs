{- https://sonomu.club/@lukiss/110538742878262809 ; Jun 14, 2023 -}
let c = [12 .. 38].shuffled.degreeToKey([0 2 4 7 9], 12);
let w = LfSaw(8, 0) * 0.012 + 1;
let t = [6, 3 / 2, 3, 3 / 4, 1 / 4];
let d = Demand(
	TDuty(1 / t, 0, 1),
	0,
	Dseq(inf, [1 .. 24].collect { :n | Dseq(1, c @* [1, n + 1 .. c.size]) })
).Lag3(0.001);
let e = LfSaw(-1 * t, 1) * 1 + 1 / 2;
let o = (LfSaw(w * d.MidiCps, 0) * e).Fold2(1) * (LfSaw(d % t.Log, 0) > 0);
let f = e.Lag3(0.005) ^ (LfSaw(pi / t, 1) * 8 + 9) * (LfSaw(0.1 / t, 1) + 1 * 5E3 + 200);
Splay(
	CombC(MoogFf(o, f, 2, 0), 0.2, 0.2, 1) * 0.8,
	LfSaw(pi, 0)
)
