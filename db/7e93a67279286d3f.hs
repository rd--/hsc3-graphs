-- envTrapezoid
let t = envTrapezoid 0.05 0.95 3 0.1
    e = envGen KR 1 1 0 1 RemoveSynth t
in sinOsc AR 440 0 * e
