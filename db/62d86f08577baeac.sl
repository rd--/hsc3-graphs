;; Freezer ; k-rate instance
var buf = 0;
var n = { :i :j | LinLin(LfNoise2(0.1), -1, 1, i, j) };
Freezer(buf, n(0.3, [0.4, 0.5]), n(0.5, [0.6, 0.7]), n(0.3, [0.6, 0.8]), n(0.95, 1.05), n(0.05, 0.15), n(0.05, 0.15), n(0.05, 0.15), 0, 0, 36)
