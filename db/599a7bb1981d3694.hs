-- ringz ; modulate frequency
let n = whiteNoiseId 'α' ar
    f = xLine kr 100 3000 10 RemoveSynth
in ringz (n * 0.005) f 0.5 * 0.2
