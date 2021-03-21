-- vbFourses ; smoothing is an i-Rate input
let w = lfPulse AR 1 0 0.5 * 100 + 100
    freqs = mce [w, 200]
    src = X.vbFourses AR 0.9 freqs -- mouseX KR 0.4 0.9 Linear 0.1
in leakDC (mceChannel 0 src) 0.995 * 0.4
