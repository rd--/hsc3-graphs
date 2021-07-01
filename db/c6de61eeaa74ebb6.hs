-- freqShift ; Modulating shift and phase
let s = lfNoise2Id 'α' ar 0.3
    i = sinOsc ar 10 0
    p = linLin (sinOsc ar 500 0) (-1) 1 0 (2 * pi)
in freqShift i (s * 1500) p * 0.1
