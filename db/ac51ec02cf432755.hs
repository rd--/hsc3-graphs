-- harmonicOsc
let modulator = sinOsc kr 0.1 0
    freq = modulator `in_exprange` (10,1000)
    firstharmonic = 3
    amplitudes = X.rRandNId 16 'β' 0.01 0.1
    sig = X.harmonicOsc ar freq firstharmonic amplitudes
in pan2 sig modulator 0.2
