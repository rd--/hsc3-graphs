{- http://www.fredrikolofsson.com/f0blog/?q=node/537 ; graph rewrite (rd) -}
let n = [
	0 0 0 0 0 0 0 3 4 6 4 0 3 2 0 0 0 0 1 6 0 1 0 0 0 0 0 0 4 0 0 3
	1 1 2 0 0 3 3 0 0 3 4 0 1 3 0 0 0 0 1 0 1 7 0 0 5 6 3 0 4 0 9 0
];
let b = [0 2 4 5 7 9 11].asLocalBuf;
let tr = Impulse(4, 0);
let k = DegreeToKey(b, Sequencer(n, tr), 12);
let e = Decay2(tr, 0.01, TRand(0.15, 0.5, tr));
{
	let m = 48 + k + TRand(0, 0.05, tr);
	let b = Blip(m.MidiCps, TRand(1, 7, tr)) * e * 8;
	CombC(b.Tanh / 8, 1, 1, 8) * TRand(0.05, 0.15, tr)
} ! 2
