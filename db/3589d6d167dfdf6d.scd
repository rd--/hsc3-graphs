// http://earslap.com/weblog/music-release-laconicism.html ; wait
var x = LFNoise1.ar(0.5 * LocalIn.ar(1, 0) + 0.1) * 0.5 + 0.5;
PitchShift.ar(
	PitchShift.ar(
		Pulse.ar([90, 90.01], x),
		10,
		x * 4,
		x,
		0
	),
	10,
	4 - (x * 4),
	1 - x,
	0
) <! LocalOut.ar(x)
