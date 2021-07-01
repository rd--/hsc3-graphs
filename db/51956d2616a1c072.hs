-- freqShift ; Shifting bandpassed noise
let n1 = whiteNoiseId 'α' ar
    n2 = lfNoise0Id 'β' ar 5.5
    i = bpf n1 1000 0.001
    s = n2 * 1000
in freqShift i s 0 * 32
