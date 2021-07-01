-- ramp ; lag pitch
let o = lfPulse kr 4 0 0.5 * 50 + 400
    l = line kr 0 1 15 DoNothing
    f = ramp o l
in sinOsc ar f 0 * 0.3
