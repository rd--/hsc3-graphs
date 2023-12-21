// DelaySet - n random delays
var x = MouseX.kr(minval: 110, maxval: 660, warp: 0, lag: 0.1);
var y = MouseY.kr(minval: 0, maxval: 0.4, warp: 0, lag: 0.2);
var s = SinOsc.ar(freq: x, phase: 0, mul: y);
var n = 10;
var a = { [5.0.rand, 0.2 + 0.8.rand, (1/40) + (1/40).rand] } ! n;
[s, DelaySet.ar(in: s, spec: a.flatten)]
