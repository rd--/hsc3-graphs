;; SinOsc ; modulate freq
var f1 = XLn(1, 1000, 9);
var f2 = SinOsc(f1, 0) * 200 + 800;
SinOsc(f2, 0) * 0.25
