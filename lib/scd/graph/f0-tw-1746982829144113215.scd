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

//---- https://twitter.com/redFrik/status/1746982829144113215 f0
play{ar(LocalOut,ar(DelayN,sin(ar(Hilbert,ar(LPF,ar(HPF,z=ar(LocalIn,14,(0!14)[0]=1/4)@@(1..14),140),11400),1.4).flop@1),d=0.14*1.4,d/(1..4)));Splay ar:z/4}// #SuperCollider

//---- calculations
(0 .. 13).rotate(-1) == [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 0]
(1 .. 14) % 14 == [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 0]