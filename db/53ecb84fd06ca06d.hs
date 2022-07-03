-- svfHp ; changing Q
let q = line kr 2 0.0001 20 RemoveSynth
in X.svfHp (whiteNoiseId 'α' ar * 0.1) 12000 q
