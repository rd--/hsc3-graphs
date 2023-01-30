;; interesting rising sounds ; https://github.com/cianoc/supercollider_fragments
var f = { :c | Pan2(SinOsc(LfSaw((c * 0.2 + 1) / 3, 0) * 500 + 700, 0), LfNoise0(1), 0.05) };
1.to(5).collect(f).sum
