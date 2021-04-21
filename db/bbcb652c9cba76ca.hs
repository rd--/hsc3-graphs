-- rsvfhp ; changing Q
let q = line KR 2 0.0001 20 RemoveSynth
in X.rsvfhp (whiteNoise 'α' AR * 0.1) 12000 q
