-- MiPlaits ; something...
let trigger = dustId 'α' kr (range_hs (0.1,7) (lfNoise2Id 'β' kr 0.1))
    harmonics = sinOsc kr 0.03 0 * 0.5 + 0.5
    timbre = lfTri kr 0.07 0 * 0.5 + 0.5
    morph = lfTri kr 0.11 0 * 0.5 + 0.5
    pitch_ = tiRandId 'γ' 24 48 trigger
    engine = roundE (tRandId 'δ' 0 15 trigger)
    sub = sinOsc ar (midiCPS pitch_) 0 * 0.1
    mi = X.miPlaits ar pitch_ engine harmonics timbre morph trigger 0 0 0 0 0.8 0.2 * 0.5
in (mi + sub) * 0.2
