-- MiPlaits ; scanning through some engines + vibrato
let pit = 50
    vib = sinOsc AR 6 0 * 0.3
    eng = lfNoise0 'α' KR 0.5 * 4 + 4
in X.miPlaits AR (pit + vib) eng 0.1 0.5 0.5 0 0 0 0 0 0.5 0.5 * 0.1
