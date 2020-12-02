-- inFeedback
let b  = firstPrivateBus
    s0 = out b (sinOsc AR 220 0 * 0.1)
    s1 = out 0 (sinOsc AR 660 0 * 0.1)
in mrg [s0, s1]
