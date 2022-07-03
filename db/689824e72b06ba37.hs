-- obxdFilter
let cutoff = mouseX kr 110.0 (110.0 * 16) Exponential 0.2
    resonance = 0.0
in X.obxdFilter (pinkNoiseId 'α' ar * 0.5) cutoff resonance 0.0 0.0 0.0
