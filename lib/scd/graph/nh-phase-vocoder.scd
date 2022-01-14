// phase vocoder (nh) ; https://scsynth.org/t/old-school-vocoders/5198/6
var buf = 0;
var src = PlayBuf.ar(1, buf, BufRateScale.kr(buf), loop: 1);
var numBands = 32;
var bandFreqs = LinExp.ir(0.to(numBands - 1), 0, numBands - 1, 100, 8000);
var freq = (60 + [0, 3, 7]).midicps;
var voicedCarrier = Saw.ar(freq);
var isVoiced = Lag.ar(ZeroCrossing.ar(src).cpsmidi.lag(0.05) > 5000.cpsmidi, 0.05);
var carrier = SelectX.ar(isVoiced, [voicedCarrier, PinkNoise.ar()]);
var snd = Amplitude.ar(BPF.ar(src, bandFreqs, 0.05), 0.01, 0.05) * BPF.ar(carrier, bandFreqs, 0.05) * numBands;
snd.sum ! 2 * 0.25

// phase vocoder (nh) ; https://scsynth.org/t/old-school-vocoders/5198/6
var buf = 0;
var src = PlayBuf.ar(1, buf, BufRateScale.kr(buf), loop: 1);
var numBands = 32;
var bandFreqs = LinExp.ir(0.to(numBands - 1), 0, numBands - 1, 100, 8000);
var freq = (60 + { TChoose.kr(Dust.kr(0.5), [-9, -7, -5, -3, -2, 0, 2, 3, 5, 7, 9, 10]) }.dup(3)).midicps;
var voicedCarrier = Saw.ar(freq);
var isVoiced = Lag.ar(ZeroCrossing.ar(src).cpsmidi.lag(0.05) > 5000.cpsmidi, 0.05);
var carrier = SelectX.ar(isVoiced, [voicedCarrier, PinkNoise.ar()]);
var filterQ = TRand.kr(10, 100, Dust.kr(0.5));
var srcAmp = Amplitude.ar(BPF.ar(src, bandFreqs, 1 / filterQ), 0.01, 0.05);
var snd = BPF.ar(carrier, bandFreqs, 0.05) * srcAmp;
Pan2(snd.sum, 0, numBands / 4)

//---- buffer allocation
Buffer.read(s, Platform.systemAppSupportDir +/+ "sounds" +/+ "a11wlk01.wav", bufnum: 0);
