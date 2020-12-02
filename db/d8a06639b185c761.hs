-- allpassN ; add input to the filtered sound to hear the effect of the phase comb
let n = whiteNoise 'β' AR * 0.05
    dly = xLine KR 0.0001 0.01 20 RemoveSynth
in n + allpassN n 0.01 dly 0.2
