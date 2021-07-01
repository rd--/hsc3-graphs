-- neoFormant
let modulator = sinOsc kr 0.1 0
    formantfreq = 150
    carrierfreq = lfNoise2Id 'α' kr 10 `in_exprange` (100,550)
    phaseshift = modulator `in_range` (0,1)
    sig = X.neoFormant ar formantfreq carrierfreq phaseshift
in pan2 sig modulator 0.1
