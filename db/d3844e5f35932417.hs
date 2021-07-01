-- bufDelayC ; mouse control for delay time
let b = localBufId 'α' 1 44100
    t = dustId 'β' ar 1
    n = whiteNoiseId 'γ' ar
    d = decay t 0.3 * n * 0.2
    x = mouseX kr 0.0 0.2 Linear 0.1
in d + bufDelayC b d x
