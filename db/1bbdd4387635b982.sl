{- Bowed string (Jmcc) ; klank -}
let root = 5;
let scale = [0 2 4 5 7 9 11] + root;
let oct = [24 36 48 60 72 84];
let f = (scale.atRandom + oct.atRandom).MidiCps;
let x = BrownNoise(2) * 0.007 * (LfNoise1(ExpRand(0.125, 0.5)) * 0.6 + 0.4).Max(0);
let d = [
	12.arithmeticSeries(f, f),
	12.geometricSeries(1, Rand(0.7, 0.9)),
	{ Rand(1, 3) } ! 12
].transposed.concatenation;
let k = Klank(x, 1, 0, 1, d);
(k * 0.1).SoftClip
