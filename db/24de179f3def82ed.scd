// https://sonomu.club/@lukiss/112090171577198222 ; Mar 14, 2024
var m = {
	QuadL.ar(LFDNoise1.ar(1) + 1 ** 2, 1, -1, -0.75, 0)
};
var i = BPF.ar(LocalIn.ar(2, 0), 440, 1);
var u = Splay.ar(
	VarSaw.ar(
		m ! 12 / 4 + 111 * (0 .. 2).collect { | n |
			n * 12 + [0, 2, 5, 9]
		}.flat.midiratio,
		0,
		m.value.sin + 1 / 2 ** 2
	) * LFSaw.ar(-2 * m.value ** 2 * 2, 0).max(0),
	m.value
);
var d = DelayC.ar(i, 1, 1 / 3);
var o = (d * (m.value + 1 / 2) + u).tanh;
o * -6.dbamp <! LocalOut.ar(o)
