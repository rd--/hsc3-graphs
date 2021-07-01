-- moogFF
let n = whiteNoiseId 'α' ar * 0.05
    freq = mouseX kr 100 10000 Exponential 0.1
    gain = mouseY kr 0 4 Linear 0.1
in moogFF n freq gain 0
