// https://sccode.org/1-5d6 (jpd) ; requires buf=10;buf=11 ; paulstretch
var bufNum = 10;
var envBufNum = 11;
var pan = 0;
var stretch = 50;
var window = 0.25;
var amp = 1;
var sampleRate = SampleRate.ir;
var fftSize = 2 ** (window * sampleRate).log2.floor;
var trigPeriod = fftSize / sampleRate;
var trig = Impulse.ar(1 / trigPeriod, 0);
var bufDur = BufDur.kr(bufNum);
var pos1 = Demand.ar(trig, 0, Dseries.dr(0, trigPeriod / (stretch * bufDur), inf));
var pos2 = pos1 + (trigPeriod / (2 * stretch * bufDur));
var grains = GrainBuf.ar(1, trig, trigPeriod, bufNum, 1, [pos1, pos2], 2, 0, envBufNum, 512) * amp;
var diffused = grains.collect {	| item |
	var c1 = FFT.kr(LocalBuf(fftSize, 1), item, 1, -1, 1, 0);
	var c2 = PV_Diffuser.kr(c1, 1 - trig);
	IFFT.ar(c2, -1, 0)
};
var enveloped = diffused * PlayBuf.ar(1, envBufNum, 1 / trigPeriod, 1, 0, 1, 0);
var delayed = DelayC.ar(enveloped[1], trigPeriod / 2, trigPeriod / 2);
Pan2.ar(enveloped[0] + delayed, pan, 1)
