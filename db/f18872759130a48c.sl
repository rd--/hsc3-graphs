;; synched impulses ; https://github.com/cianoc/supercollider_fragments
var sync = 5;
[
	SinOsc(100, 0) * Decay2(Impulse(3 / sync, 0), 0.01, 1),
	SinOsc(300, 0) * Decay2(Impulse(7 / sync, 0), 0.01, 1),
	SinOsc(500, 0) * Decay2(Impulse(5 / sync, 0), 0.01, 1),
	SinOsc(700, 0) * Decay2(Impulse(2 / sync, 0), 0.01, 1),
	SinOsc(900, 0) * Decay2(Impulse(9 / sync, 0), 0.01, 1),
	SinOsc(1100, 0) * Decay2(Impulse(6 / sync, 0), 0.01, 1),
	SinOsc(1300, 0) * Decay2(Impulse(1 / sync, 0), 0.01, 1)
].sum * 0.1
