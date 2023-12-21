(* thestart (modified) *)
var amp = 0.2, ampLagTime = 5, freq = 1000, pos = 1, posLagTime = 30;
var src = {
	Hpf(
		Bpf(PinkNoise() * Line(0, amp, ampLagTime), [450, 250, 150], 0.2),
		LinLin(LfNoise2([0.1, 0.11, 0.14]), -1, 1, 100,800)
	)
} !+ 3;
XFade2(src.Splay, Lpf(src, freq), Line(0, pos, posLagTime), 1)
