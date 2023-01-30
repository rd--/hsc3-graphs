;; phase modulation, all three ; https://github.com/cianoc/supercollider_fragments
{
	var car = LfNoise0(9) * 300 + 700;
	var mod = LfNoise0(9) * 500 + 700;
	var ix = LfNoise0(9) * 6 + 12;
	PmOsc(car, mod, ix, 0) * 0.15
} ! 2
