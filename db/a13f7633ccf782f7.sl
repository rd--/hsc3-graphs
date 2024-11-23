/* https://twitter.com/redFrik/status/1746982829144113215 f0 */
let z = LocalIn(14, [1 / 4] ++ (0 # 13));
let d = 0.14 * 1.4;
let h = Hilbert(
	Lpf(
		Hpf(
			z.rotated(-1),
			140
		),
		11400
	)
) * 1.4;
let l = LocalOut(DelayN(h.transposed.second.Sin, d, d / 1:4));
Splay(z) <! l / 4
