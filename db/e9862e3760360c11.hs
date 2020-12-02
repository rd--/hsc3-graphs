-- inFeedback ; resonator at 440hz, see localOut for variant
let b = firstPrivateBus
    p = inFeedback 1 b
    i = impulse AR 1 0
    d = delayC (i + (p * 0.995)) 1 (recip 440 - recip controlRate)
in mrg [offsetOut b d, offsetOut 0 p]
