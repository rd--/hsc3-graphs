;; Resonz ; modulate frequency ; SinOsc
var f = SinOsc(0.5, 0) * 40 + 220;
Resonz(WhiteNoise(), f, 0.1)
