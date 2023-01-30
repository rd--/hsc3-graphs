;; pretty ; nice, but inessential ; https://github.com/cianoc/supercollider_fragments ; Rand
{ :i |
	var freq = MouseX(Rand(0.1, 5), Rand(3, 20), 0, 0.2);
	var amp = LfNoise0(MouseX(Rand(1, 6), Rand(1, 6), 0, 0.2)).Max(0);
	var osc = SinOsc(SinOsc(freq, 0) * MouseY(10, 50, 0, 0.2) + Rand(200, 5000), 0) * amp;
	Pan2(osc, 1.Rand2, 0.03)
}.map([1 .. 12]).sum
