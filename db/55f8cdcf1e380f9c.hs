-- inRange ; trigger noise burst
let n = brownNoiseId 'α' ar * 0.1
    x = mouseX kr 1 2 Linear 0.1
    o = sinOsc kr x 0 * 0.2
in inRange o (-0.15) 0.15 * n
