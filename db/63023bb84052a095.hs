-- allpassC ; allpass delay has no audible effect as a resonator on steady state sound
let dly = xLine KR 0.0001 0.01 20 RemoveSynth
    n = whiteNoise 'α' AR * 0.05
in allpassC n 0.01 dly 0.2
