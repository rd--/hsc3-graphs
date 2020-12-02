-- moogVCF
let o = pulse AR (mce2 40 121) (mce2 0.3 0.7)
    cf = range 30 4200 (sinOsc KR (range 0.001 2.2 (lfNoise0 'α' KR 0.42)) 0)
in X.moogVCF o cf 0.8 * 0.25
