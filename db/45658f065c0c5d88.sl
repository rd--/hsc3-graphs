{- Adc ; 8.1 ; http://www.audiosynth.com/files/SC2.2.16.sea.hqx -}
let tapData = [ {- Early reflection tap data (times, levels) -}
	[0.0043, 0.841],
	[0.0215, 0.504],
	[0.0268, 0.379],
	[0.0298, 0.346],
	[0.0485, 0.272],
	[0.0572, 0.217],
	[0.0595, 0.192],
	[0.0708, 0.181],
	[0.0741, 0.142],
	[0.0797, 0.134]
];
let combData = [ {- Table of comb data (times, levels) -}
	[0.050,	0.46],
	[0.056,	0.48],
	[0.061,	0.50],
	[0.068,	0.52],
	[0.072,	0.53],
	[0.078,	0.55]
];
let revTime = 3; {- Global decay, time in seconds -}
let revBalance = 0.5; {- Dry/wet balance, ratio -}
let tapScale = revBalance / tapData.size; {- Tap amplitude scaling factor -}
let combScale = revBalance / combData.size; {- Comb amplitude scaling factor -}
let input = 0.5.coin.if { {- Audio input signal -}
	Impulse(0.2, 2)
} {
	Decay2(Impulse(0.2, 2), 0.001, 0.2) * PinkNoise()
};
let buffer = BufAlloc(1, 48000 * 0.1).BufClear; {- A buffer for the early reflections delay line -}
let revMonoInput = input.isList.if {
	input.Sum / input.size {- Reverb input must be mono -}
} {
	input
};
let delayWriter = DelayWrite(buffer, revMonoInput);
let tapsOut = 0;
let combsOut = 0;
let allPassIo = 0;
tapData.do { :params |
	tapsOut := tapsOut + (DelayTap(buffer, params.first) * params.second)
};
1:6.do { :index |
	combsOut := combsOut + (
		CombC(
			revMonoInput + tapsOut, {- TapsOut could be scaled -}
			0.1,
			combData[index].first,
			revTime
		) * combData[index].second
	)
};
allPassIo := combsOut;
4.timesRepeat {
	allPassIo := AllpassN(
		allPassIo,
		0.050,
		{ 0.050.Rand0 } ! 2,
		1
	)
};
[
	input * (1 - revBalance) # 2,
	((tapsOut + allPassIo) * revBalance)
].Sum <! delayWriter
