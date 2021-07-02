-- vbFourses ; feeding it an array of frequencies ; mix to stereo
let freqs = mceFillInt 8 (\z -> randId z 1 500)
    src = X.vbFourses ar 0.1 freqs
in mixTo 2 (leakDC src 0.995 * 0.3)
