-- bufCombN ; comb filter as resonator ; resonant fundamental is reciprocal of the delay time
let b = localBufId 'α' 1 44100
    n = whiteNoiseId 'β' ar
    dt = xLine kr 0.0001 0.01 20 RemoveSynth
in bufCombN b (n * 0.1) dt 0.2 * 0.05
