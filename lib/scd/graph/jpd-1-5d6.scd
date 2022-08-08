// https://sccode.org/1-5d6 (jpd) ; requires buf=10;buf=11 ; paulstretch
var bufnum = 10;
var  envBufnum = 11;
var pan = 0;
var stretch = 50;
var window = 0.25;
var amp = 1;
var fftSize = 2 ** (window * SampleRate.ir).log2.floor;
var trigPeriod = fftSize / SampleRate.ir;
var trig = Impulse.ar(1 / trigPeriod, 0);
var bufdur = BufDur.kr(bufnum);
var pos = Demand.ar(trig, 0, Dseries.dr(0, trigPeriod / (stretch * bufdur), inf));
var grains = [
	GrainBuf.ar(1, trig, trigPeriod, bufnum, 1, pos, 2, 0, envBufnum, 512),
	GrainBuf.ar(1, trig, trigPeriod, bufnum, 1, pos + (trigPeriod / (2 * stretch * bufdur)), 2, 0, envBufnum, 512)
] * amp;
var diffused = grains.collect({
	arg item;
	var c1 = FFT.kr(LocalBuf(fftSize, 1), item, 1, -1, 1, 0);
	var c2 = PV_Diffuser.kr(c1, 1 - trig);
	IFFT.ar(c2, -1, 0)
});
var enveloped = diffused * PlayBuf.ar(1, envBufnum, 1 / trigPeriod, 1, 0, 1, 0);
var delayed = DelayC.ar(enveloped.second, trigPeriod / 2, trigPeriod / 2);
Pan2.ar(enveloped.first + delayed, pan, 1)

//---- allocate buffers
var buffer = Buffer.read(s, Platform.resourceDir +/+ "sounds/a11wlk01.wav", 0, -1, nil, 10);
var envBuf = Buffer.alloc(s, s.sampleRate, 1, nil, 11);
var envSignal = Signal.newClear(s.sampleRate).waveFill({ arg x; (1 - x.pow(2)).pow(1.25) }, -1, 1);
envBuf.loadCollection(envSignal);
