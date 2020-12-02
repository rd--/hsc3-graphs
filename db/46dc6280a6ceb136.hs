-- ramp ; lag pitch
let o = lfPulse KR 4 0 0.5 * 50 + 400
    l = line KR 0 1 15 DoNothing
    f = ramp o l
in sinOsc AR f 0 * 0.3
