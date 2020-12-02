-- bufDelayC ; mouse control for delay time
let b = localBuf 'α' 1 44100
    t = dust 'β' AR 1
    n = whiteNoise 'γ' AR
    d = decay t 0.3 * n * 0.2
    x = mouseX KR 0.0 0.2 Linear 0.1
in d + bufDelayC b d x
