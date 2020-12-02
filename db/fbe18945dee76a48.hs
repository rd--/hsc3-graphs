-- MiPlaits ; 5=wavetable
let trigger = impulse KR 8 0
    harm = lfNoise2 'α' KR 0.3 * 0.25 + 0.25
    timbre = lfNoise1 'α' KR 0.4 * 0.5 + 0.5
    dec = range 0.01 0.8 (lfNoise2 'α' KR 0.2)
in X.miPlaits AR 44 (X.miPlaits_mode "wavetable") harm timbre 0 trigger 0 0 0 0 dec 0.5 * 0.2
