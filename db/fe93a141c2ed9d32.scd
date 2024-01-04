// DelayMap ; event control
Voicer(0, 16) { |e|
	var b = LocalBuf(numFrames: 2 * 48000, numChannels: 1).clear;
	var a = [
		-1, e.y, 0, 0.5,
		1.5, -1, 0, 1
	];
	var f = (e.x * 24 + 48).midiCps;
	var o = SinOsc.ar(freq: f, phase: 0) * e.z * Lag.kr(in: e.w, lagTime: 5);
	[DelayMap.ar(bufnum: b, in: o, dynamic: 0, spec: a), o]
}.sum
