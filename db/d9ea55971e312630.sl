let freq = 400;
[
	SyncSaw(freq, freq * MouseX(1, 3, 0, 0.2)),
	Impulse(freq, 0)
] * 0.1
