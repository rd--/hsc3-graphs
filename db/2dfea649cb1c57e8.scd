// phase vocoder (nh) ; https://scsynth.org/t/old-school-vocoders/5198/6
var buf = 0;
var src = PlayBuf.ar(1, buf, BufRateScale.kr(buf), 1, 0, 1, 0);
var numBands = 32;
var bandFreqs = (0 .. numBands - 1).linexp(0, numBands - 1, 100, 8000);
var freq = (60 + [0, 3, 7]).midicps;
var voicedCarrier = Saw.ar(freq);
var isVoiced = Lag.ar(ZeroCrossing.ar(src).cpsmidi.lag(0.05) > 5000.cpsmidi, 0.05);
var carrier = SelectX.ar(isVoiced, [voicedCarrier, PinkNoise.ar]);
var snd = Amplitude.ar(BPF.ar(src, bandFreqs, 0.05), 0.01, 0.05) * BPF.ar(carrier, bandFreqs, 0.05) * numBands;
snd.sum ! 2 * 0.25
