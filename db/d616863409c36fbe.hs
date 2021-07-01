-- bPeakEQ
let i = pinkNoiseId 'α' ar * 0.1
    freq = mouseX kr 2200 18000 Exponential 0.2
    db = mouseY kr (-12) 12 Linear 0.2
in bPeakEQ i freq 0.8 db * 0.5
