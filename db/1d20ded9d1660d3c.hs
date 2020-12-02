-- MiPlaits ; something...
let trigger = dust 'α' KR (range_hs (0.1,7) (lfNoise2 'β' KR 0.1))
    harmonics = sinOsc KR 0.03 0 * 0.5 + 0.5
    timbre = lfTri KR 0.07 0 * 0.5 + 0.5
    morph = lfTri KR 0.11 0 * 0.5 + 0.5
    pitch_ = tiRand 'γ' 24 48 trigger
    engine = roundE (tRand 'δ' 0 15 trigger)
    sub = sinOsc AR (midiCPS pitch_) 0 * 0.1
    mi = X.miPlaits AR pitch_ engine harmonics timbre morph trigger 0 0 0 0 0.8 0.2 * 0.5
in (mi + sub) * 0.2
