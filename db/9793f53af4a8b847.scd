// DelayMap - one second delay at quarter gain
var b = LocalBuf(numFrames: 2 * 48000, numChannels: 1).clear;
var a = [
	-1, 0, 0, 0.5,
	1, -1, 0, 1
];
var x = MouseX.kr(minval: 110, maxval: 440, warp: 0, lag: 0.1);
var y = MouseY.kr(minval: 0.0, maxval: 0.2, warp: 0, lag: 0.1);
var o = SinOsc.ar(freq: x, phase: 0) * y;
[DelayMap.ar(bufnum: b, in: o, dynamic: 0, spec: a), o]
