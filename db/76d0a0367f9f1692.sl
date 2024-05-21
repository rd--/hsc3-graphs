{- https://twitter.com/redFrik/status/1762790022623674534 (f0) -}
let l = LocalIn(5, 0);
let y = [0 3.084 5.028 6.972 10.056];
let z = SinOsc(
	(SinOsc(1 / 5 * l, 0:4 / 5 * 2 * pi).RoundTo(1) * 12 + 60 + y).MidiCps,
	DelayN(l, 1 / 5, 1 / 5) * 2 * pi
) / 5;
Hpf(z, 9).Splay <! LocalOut(z)
