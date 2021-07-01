-- localOut ; resonator, must subtract blockSize for correct tuning
let p = localIn 1 ar 0
    i = impulse ar 1 0
    d = delayC (i + (p * 0.995)) 1 (recip 440 - recip controlRate)
in mrg [offsetOut 0 p,localOut d]
