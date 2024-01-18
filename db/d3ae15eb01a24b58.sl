{- Gendy1 ; texture ; mouse control ; requires=keywords ; requires=kr -}
let n = 11;
Resonz(
	{
		let freq = Rand(50, 560.3);
		let numCps = Rand(2, 20);
		let kNum = MulAdd(SinOsc(ExpRand(0.02, 0.2), 0), numCps / 2, numCps / 2);
		let osc = Gendy1(
			ampDist: Rand(0, 6),
			durDist: Rand(0, 6),
			adParam: Rand(0, 1),
			ddParam: Rand(0, 1),
			minFreq: freq,
			maxFreq: freq,
			ampScale: Rand(0, 1),
			durScale: Rand(0, 1),
			initCps: numCps,
			kNum: kNum.kr
		);
		EqPan2(osc, Rand(-1, 1)) * 0.5 / n.sqrt
	} !+ n,
	MouseX(100, 2000, 0, 0.2),
	MouseY(0.01, 1.0, 0, 0.2)
)
