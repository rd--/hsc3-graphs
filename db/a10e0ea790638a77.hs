-- vbFourses ; modulate inputs ; splay
let freqs = lfNoise0Id 'α' ar (mce [4, 3, 2, 1, 1, 2, 3, 4]) `in_range` (1,1200)
    src = X.vbFourses ar 0.7 freqs
in splay (leakDC src 0.995) 1 0.3 0 True
