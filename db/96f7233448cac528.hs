-- obxdFilter
let cutoff = mouseX kr 110.0 (110.0 * 16) Exponential 0.2
    resonance = mouseY kr 0.0 1.10 Linear 0.2
in X.obxdFilter (pinkNoiseId 'α' ar * 0.5) cutoff resonance 0.5 0.0 0.0
