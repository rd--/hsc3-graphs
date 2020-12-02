-- allpassC ; cubic variant
let dly = xLine KR 0.0001 0.01 20 RemoveSynth
    n = whiteNoise 'δ' AR * 0.05
in n + allpassC n 0.01 dly 0.2
