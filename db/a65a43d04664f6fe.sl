(* https://sccode.org/1-5d6 (jpd) ; requires=SfAcquire *)
var sampleRate = 48000;
var sndBuf = SfAcquireMono('floating_1');
var envBuf = [-1 1].resamp1(sampleRate).collect { :x |
	(1 - (x ^ 2)) ^ 1.25
}.asLocalBuf;
var pan = 0;
var stretch = 50;
var window = 0.25;
var amp = 1;
var fftSize = 2 ^ (window * sampleRate).Log2.Floor;
var trigPeriod = fftSize / sampleRate;
var trig = Impulse(1 / trigPeriod, 0);
var bufDur = BufDur(sndBuf);
var pos1 = Demand(trig, 0, Dseries(inf, 0, trigPeriod / (stretch * bufDur)));
var pos2 = pos1 + (trigPeriod / (2 * stretch * bufDur));
var grains = GrainBuf(
	1,
	trig,
	trigPeriod,
	sndBuf,
	1,
	[pos1, pos2],
	2,
	0,
	-1 (* envBuf *),
	512
) * amp;
var diffused = grains.collect { :item |
	var c1 = Fft(BufAlloc(1, fftSize), item, 1, -1, 1, 0);
	var c2 = PvDiffuser(c1, 1 - trig);
	Ifft(c2, -1, 0)
};
var enveloped = diffused * PlayBuf(1, envBuf, 1 / trigPeriod, 1, 0, 1, 0);
var delayed = DelayC(enveloped.second, trigPeriod / 2, trigPeriod / 2);
Pan2(enveloped.first + delayed, pan, 1)
