;; Resonz ; modulate frequency ; XLn
var f = XLn(1000, 8000, 10);
Resonz(WhiteNoise() * 0.1, f, 0.05)
