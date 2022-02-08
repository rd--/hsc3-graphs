// GrainSin ; keywords
var overlap = MouseY.kr(minval: 0, maxval: 2, warp: 0, lag: 0.2);
var f = MouseX.kr(minval: 1, maxval: 220, warp: 0, lag: 0.2);
var t = Impulse.ar(freq: f, phase: 0);
var a = GrainSin.ar(numChannels: 2, trigger: t, dur: overlap/f, freq: 440, pan: 0, envbufnum: -1, maxGrains: 512);
LeakDC.ar(in: a, coef: 0.995) * 0.1
