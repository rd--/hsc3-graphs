-- bPeakEQ
let i = pinkNoiseId 'α' ar * 0.1
    freq = mouseX kr 2200 18000 Exponential 0.2
    rq = mouseY kr 10 0.4 Linear 0.2
in bPeakEQ i freq rq 6 * 0.5
