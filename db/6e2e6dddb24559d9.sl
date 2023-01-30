;; wandering sines ; https://github.com/cianoc/supercollider_fragments
var o = SinOsc((LfNoise1(0.5) * 600 + (LfSaw(1.5, 0) * 50 + 500)).Abs, 0) * 0.1;
var d = CombN(o, 3.0, [1.35, 0.7], 6);
Pan2(o, 0, 1) + d
