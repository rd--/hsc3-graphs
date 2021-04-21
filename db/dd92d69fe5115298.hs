-- rsvflp ; changing Q
let q = line KR 2 0.0001 20 RemoveSynth
in X.rsvflp (whiteNoise 'α' AR * 0.1) 400 q
