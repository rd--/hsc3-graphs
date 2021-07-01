-- rsvflp ; changing F
let f = xLine kr 20 20000 20 RemoveSynth
in X.rsvflp (whiteNoiseId 'α' ar * 0.1) f 1
