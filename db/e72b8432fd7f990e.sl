{- Freezer ; k-rate instance -}
let sf = SfAcquireMono('crotale-d6');
let n = { :f :i :j |
	LfNoise2(f).LinLin(-1, 1, i, j)
};
let left = n(1, 0.3, [0.6 0.8]);
let right = left + n(1, 0.01, [0.05 0.1]);
Freezer(sf, left, right, [0.1 0.2], 0.5, 0.1, 0.5, 0.05, 0, 0, 24)
