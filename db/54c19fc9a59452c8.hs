-- rObxdFilter
let cutoff = mouseX KR 110.0 (110.0 * 16) Exponential 0.2
    resonance = 0.0
in X.rObxdFilter (pinkNoise 'α' AR * 0.5) cutoff resonance 0.0 0.0 0.0
