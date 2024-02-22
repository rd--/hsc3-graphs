// https://twitter.com/redFrik/status/1746982829144113215 f0
var z = LocalIn.ar(14, [1 / 4] ++ (0 ! 13));
var d = 0.14 * 1.4;
var h = Hilbert.ar(
	LPF.ar(
		HPF.ar(
			z.rotate(-1),
			140
		),
		11400
	)
) * 1.4;
LocalOut.ar(DelayN.ar(h.flop[1].sin, d, d / (1 .. 4)));
Splay.ar(z) / 4
