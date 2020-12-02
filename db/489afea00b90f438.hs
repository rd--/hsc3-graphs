-- metro
let b = range 30 240 (lfNoise2 'α' KR 0.2)
    n = dseq 'β' dinf (mce [1,0.25,0.5,0.25])
in decay (X.metro KR b n) 0.2 * sinOsc AR 440 0 * 0.1
