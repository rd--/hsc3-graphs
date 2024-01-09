// bit-reduction (adc) requires=keywords
var f = LFNoise2.kr(8);
var nh = LFNoise2.kr(3);
var src = Blip.ar(f * 200 + 300, nh * 10 + 20);
var sr = MouseX.kr(1000, SampleRate.ir * 0.1, 'exponential', 0.2);
var bit_sz = MouseY.kr(1, 24, 'exponential', 0.2);
var down_sample = Latch.ar(src, Impulse.ar(sr, 0));
var bit_redux = down_sample.round(0.5 ** bit_sz);
[down_sample, bit_redux]

// ---- bit-reduction (adc) ; requires=keywords
{ var f = LFNoise2.kr(freq: 8)
; var nh = LFNoise2.kr(freq: 3)
; var src = Blip.ar(freq: f * 200 + 300, numharm: nh * 10 + 20)
; var sr = MouseX.kr(minval: 1000, maxval: SampleRate.ir * 0.1, warp: 'exponential', lag: 0.2)
; var bit_sz = MouseY.kr(minval: 1, maxval: 24, warp: 'exponential', lag: 0.2)
; var down_sample = Latch.ar(in: src, trig: Impulse.ar(freq: sr, phase: 0))
; var bit_redux = down_sample.round(0.5 ** bit_sz)
; [down_sample, bit_redux] }
