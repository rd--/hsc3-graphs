-- median ; median = high frequency noise ; leakDC = low frequency noise
let n = whiteNoiseId 'α' ar
    s = median 31 (n * 0.1 + sinOsc ar 800 0 * 0.1)
in leakDC s 0.9
