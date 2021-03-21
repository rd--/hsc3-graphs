-- vbFourses ; feeding it an array of frequencies ; mix to stereo
let freqs = mceFill 8 (\z -> rand (z :: Int) 1 500)
    src = X.vbFourses AR 0.1 freqs
in mixN 2 (leakDC src 0.995 * 0.3)
