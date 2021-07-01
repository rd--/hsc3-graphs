-- allpassC ; cubic variant
let dly = xLine kr 0.0001 0.01 20 RemoveSynth
    n = whiteNoiseId 'δ' ar * 0.05
in n + allpassC n 0.01 dly 0.2
