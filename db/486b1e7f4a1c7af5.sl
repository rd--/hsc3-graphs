;; thestart (modified)
var amp = 0.2, ampLagTime = 5, freq = 1000, pos = 1, posLagTime = 30;
var gen = {
	Hpf(
		Bpf(PinkNoise() * Ln(0, amp, ampLagTime), [450, 250, 150], 0.2),
		LinLin(LfNoise2([0.1, 0.11, 0.14]), -1, 1, 100,800)
	)
};
var src = gen !+ 3;
XFade2(src.Splay2, Lpf(src, freq), Ln(0, pos, posLagTime), 1)