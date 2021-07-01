-- envCoord ; co-ordinate (break-point) envelope
let c = EnvLin
    p = envCoord [(0,0),(0.5,0.1),(0.55,1),(1,0)] 9 0.1 c
    e = envGen kr 1 1 0 1 RemoveSynth p
in sinOsc ar 440 0 * e
