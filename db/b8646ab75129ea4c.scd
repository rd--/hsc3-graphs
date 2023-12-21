// 22 Nov. 2021 ; https://github.com/lukiss/Losers-Union-SC-Research
var n = {
	1 + ((0.00001 * (1 .. 7))).scramble
};
Splay.ar(
	VarSaw.ar(
		33 * n.(),
		0,
		LFSaw.ar(1 / 3 * n.(), 0) * LFSaw.ar(n.() / 3, 0)
	) * (LFSaw.ar(5 / 3, 0) * (LFSaw.ar(7 / 3 * n.().neg, 0).tan)).abs
).tanh
