// Stretching again ; https://github.com/lukiss/Losers-Union-SC-Research
var c = 16;
var f = 41;
var t = { | n | PulseDivider.ar(Impulse.ar(f, 0), c, 15 - n) } ! c;
Splay.ar(
	PlayBuf.ar(
		1,
		Buffer.read(s, Platform.resourceDir ++ "/sounds/a11wlk01.wav", 0, -1),
		LFNoise2.ar(1 ! c) * 0.1 / c + 1,
		t,
		Sweep.ar(0, MouseX.kr(0.001, 1 / 5, 1, 0.2)) % 1 * 180000,
		0,
		0
	) * Env.sine(c / f, 1).ar(0, t),
	1 / 8
)
