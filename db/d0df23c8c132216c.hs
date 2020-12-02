-- hypot
let x = 10
    y = lfSaw KR (1 / 6) 0 * 100
    d = hypot x y
    a = 40 / (squared d)
    s = rlpf (fSinOsc AR 200 0 * lfPulse AR 31.3 0 0.4) 400 0.3
in delayL s (110 / 344) (d / 344) * a
