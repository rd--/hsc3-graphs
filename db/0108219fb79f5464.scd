// down-sample (adc)
var f = LFNoise2.kr(8);
var nh = LFNoise2.kr(3);
var src = Blip.ar(f * 200 + 300, nh * 10 + 20);
var sr = MouseX.kr(1000, SampleRate.ir * 0.1, 'exponential', 0.2);
Latch.ar(src, Impulse.ar(sr, 0))
