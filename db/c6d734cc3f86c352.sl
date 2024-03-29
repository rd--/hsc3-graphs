{- http://sccode.org/1-5eo (bz) ; bohlen pierce scale ; graph edit ; requires=LfBrownNoise1 -}
{ :tr |
	let dev = Rand(0.2, 0.4);
	let root = TChoose(tr, [30, 32, 35, 37]);
	let buffer = [
		1, 9 / 7, 7 / 5, 5 / 3, 9 / 5, 15 / 7, 7 / 3, 25 / 9,
		3, 27 / 7, 21 / 5, 15 / 3, 27 / 5, 45 / 7, 21 / 3, 75 / 9,
		9
	].asLocalBuf;
	let lfo = LfBrownNoise1(4, dev, 0) * 4 + 5;
	let index = IndexInBetween(buffer, lfo).RoundTo(1);
	let intv = Index(buffer, index);
	{
		let freq = Lag(intv, 0.1) * root * (LfNoise2(12) * 0.02 + 1);
		let env = (LfNoise2(4) * 0.4 + 0.6) ^ 2;
		MoogLadder(Saw(freq) * env, LfNoise2(1) * 1700 + 2200, 0.3)
	} !^ 8 * 0.5
}.OverlapTexture(4, 4, 4).Mix
