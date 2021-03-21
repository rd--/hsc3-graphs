-- vbFourses ; a simple triangle wave ; supplying only one freq pair
let freqs = mce [150, 150]
    src = X.vbFourses AR 0.5 freqs
in leakDC (mceChannel 0 src) 0.995 * 0.4
