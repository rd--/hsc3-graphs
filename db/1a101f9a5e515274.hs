-- moogLadder
let o = mix (lfSaw ar (mce2 120 180) 0 * 0.33)
    cf = linExp (lfCub kr 0.1 (0.5 * pi)) (-1) 1 180 8500
in X.moogLadder o cf 0.75
