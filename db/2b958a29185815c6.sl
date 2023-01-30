;; Resonz ; modulate bandwidth
var bw = XLn(1, 0.001, 8);
Resonz(WhiteNoise() * 0.1, 2000, bw)
