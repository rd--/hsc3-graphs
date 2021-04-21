-- bPeakEQ
let i = pinkNoise 'α' AR * 0.1
    freq = mouseX KR 2200 18000 Exponential 0.2
    rq = mouseY KR 10 0.4 Linear 0.2
in bPeakEQ i freq rq 6 * 0.5
