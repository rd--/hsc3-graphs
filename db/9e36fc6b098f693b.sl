{- https://sonomu.club/@lukiss/112090171577198222 ; Mar 14, 2024 -}
let m = {
	QuadL(LfdNoise1(1) + 1 ^ 2, 1, -1, -0.75, 0)
};
let i = Bpf(LocalIn(2, 0), 440, 1);
let u = Splay(
	VarSaw(
		m:/0 ! 12 / 4 + 111 * [0 .. 2].collect { :n |
			n * 12 + [0, 2, 5, 9]
		}.flatten.MidiRatio,
		0,
		m().Sin + 1 / 2 ^ 2
	) * LfSaw(-2 * m() ^ 2 * 2, 0).Max(0),
	m()
);
let d = DelayC(i, 1, 1 / 3);
let o = (d * (m() + 1 / 2) + u).Tanh;
o * -6.DbAmp <! LocalOut(o)
