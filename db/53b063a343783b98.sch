-- lfo modulation (jmcc) #1
let o = SinOsc 0.05 0 * 80 + 160
    p = SinOsc [0.6, 0.7] 0 * 3600 + 4000
    s = Rlpf (LfPulse o 0 0.4 * 0.05) p 0.2
in CombL s 0.3 [0.2, 0.25] 2
