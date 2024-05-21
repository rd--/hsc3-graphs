{- Cpiano (Jmcc) ; Graph rewrite ; http://www.iamas.ac.jp/~aka/dspss2004/materials/ -}
{ :tr |
	let dgr = DegreeToKey(
		[0 2 4 5 7 9 11].asLocalBuf,
		TRand(0, 12, tr),
		12
	);
	let freq = (60 + dgr).MidiCps;
	let pan = TRand(-0.25, 0.25, tr);
	let amp = TRand(0.1, 0.2, tr);
	let hammerEnv = Decay2(tr, 0.008, 0.04) * amp;
	let src = [0.997, 1.0, 1.002].collect { :detune |
		let hammer = LfNoise2(3000) * hammerEnv;
		let delayTime = (freq * detune).Recip;
		let decayTime = TRand(3, 6, tr);
		CombL(hammer, delayTime, delayTime, decayTime)
	}.Sum;
	EqPan2(src, pan) / 2
}.OverlapTexture(2, 0, 9).Mix
