{- https://sccode.org/1-5d6 (jpd) ; requires=SfAcquire -}
let sampleRate = 48000;
let sndBuf = SfAcquireMono('floating_1');
let envBuf = [-1 1].resamp1(sampleRate).collect { :x |
	(1 - (x ^ 2)) ^ 1.25
}.asLocalBuf;
let pan = 0;
let stretch = 50;
let window = 0.25;
let amp = 1;
let fftSize = 2 ^ (window * sampleRate).Log2.Floor;
let trigPeriod = fftSize / sampleRate;
let trig = Impulse(1 / trigPeriod, 0);
let bufDur = BufDur(sndBuf);
let pos1 = Demand(trig, 0, Dseries(inf, 0, trigPeriod / (stretch * bufDur)));
let pos2 = pos1 + (trigPeriod / (2 * stretch * bufDur));
let grains = GrainBuf(
	1,
	trig,
	trigPeriod,
	sndBuf,
	1,
	[pos1, pos2],
	2,
	0,
	-1 {- envBuf -},
	512
) * amp;
let diffused = grains.collect { :item |
	let c1 = Fft(BufAlloc(1, fftSize), item, 1, -1, 1, 0);
	let c2 = PvDiffuser(c1, 1 - trig);
	Ifft(c2, -1, 0)
};
let enveloped = diffused * PlayBuf(1, envBuf, 1 / trigPeriod, 1, 0, 1, 0);
let delayed = DelayC(enveloped.second, trigPeriod / 2, trigPeriod / 2);
Pan2(enveloped.first + delayed, pan, 1)
