-- MiRings ; easter egg --> drone ; set damp to 1.0 to get a sustaining sound that doesn't need to be triggered
let struct = range 0 1 (lfNoise2Id 'α' kr 0.2)
    brightness = range 0 1 (lfNoise1Id 'β' kr 0.5)
in X.miRings ar 0 0 40 struct brightness 1 0.9 (X.miRings_mode "MODULATED/INHARMONIC_STRING") 2 0 1 0 * 0.25
