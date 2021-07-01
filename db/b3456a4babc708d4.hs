-- rsvfbp ; changing Q
let q = line kr 10 0.0001 20 RemoveSynth
in X.rsvfbp (whiteNoiseId 'α' ar * 0.1) 400 q
