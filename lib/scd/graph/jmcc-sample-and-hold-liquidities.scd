// sample and hold liquidities (jmcc) #4
var r = MouseX.kr(1, 200, 'exponential', 0.1);
var t = r.reciprocal;
var c = Impulse.kr(r, 0) * 0.4;
var cf = MouseY.kr(100, 8000, 'exponential', 0.1);
var f = Latch.kr(WhiteNoise.kr * cf * 0.5 + cf, c);
var p = Latch.kr(WhiteNoise.kr, c);
var i = Pan2.ar(SinOsc.ar(f, 0), p, Decay2.kr(c, 0.1 * t, 0.9 * t));
CombN.ar(i, 0.3, 0.3, 2)

// sample and hold liquidities (jmcc) #4 ; keywords
var r = MouseX.kr(minval: 1, maxval: 200, warp: 'exponential', lag: 0.1);
var t = r.reciprocal;
var c = Impulse.kr(freq: r, phase: 0) * 0.4;
var cf = MouseY.kr(minval: 100, maxval: 8000, warp: 'exponential', lag: 0.1);
var f = Latch.kr(in: WhiteNoise.kr * cf * 0.5 + cf, trig: c);
var p = Latch.kr(in: WhiteNoise.kr, trig: c);
var i = Pan2.ar(in: SinOsc.ar(freq: f, phase: 0), pos: p, level: Decay2.kr(in: c, attackTime: 0.1 * t, decayTime: 0.9 * t));
CombN.ar(in: i, maxdelaytime: 0.3, delaytime: 0.3, decaytime: 2)
