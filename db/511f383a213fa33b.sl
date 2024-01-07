(* http://earslap.com/weblog/music-release-laconicism.html ; wait *)
let x = LfNoise1(0.5 * LocalIn(1, 0) + 0.1) * 0.5 + 0.5;
let s = PitchShift(
	PitchShift(
		Pulse([90, 90.01], x),
		10,
		x * 4,
		x,
		0
	),
	10,
	4 - (x * 4),
	1 - x,
	0
);
s <! LocalOut(x)
