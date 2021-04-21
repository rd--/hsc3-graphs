-- rsvfbp ; changing Q
let q = line KR 10 0.0001 20 RemoveSynth
in X.rsvfbp (whiteNoise 'α' AR * 0.1) 400 q
