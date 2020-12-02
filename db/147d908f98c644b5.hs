-- ringz ; modulate frequency
let n = whiteNoise 'α' AR
    f = xLine KR 100 3000 10 RemoveSynth
in ringz (n * 0.005) f 0.5 * 0.2
