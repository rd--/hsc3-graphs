-- svfLp ; changing Q
let q = line kr 2 0.0001 20 RemoveSynth
in X.svfLp (whiteNoiseId 'α' ar * 0.1) 400 q
