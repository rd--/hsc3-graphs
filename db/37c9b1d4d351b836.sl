;; random bells, let it run for a while ; https://github.com/cianoc/supercollider_fragments
var k = 12;
var tr = Dust(3 / 7);
Splay2({
	SinOsc(Rand(50, 4000), 0) * Decay2(tr, 0.01, Rand(0.2, 3)) * Rand(0.1, 1)
} ! k) / k
