;; Freezer ; k-rate instance
var buf = 0;
var n = { :f :i :j | LinLin(LfNoise2(f), -1, 1, i, j) };
var left = n(1, 0.3, [0.6, 0.8]);
var right = left + n(1, 0.01, [0.05, 0.1]);
Freezer(buf, left, right, [0.1, 0.2], 0.5, 0.1, 0.5, 0.05, 0, 0, 24)
