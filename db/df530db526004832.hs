-- bLowPass
let i = mix (saw ar (mce [0.99, 1, 1.01] * 440) * 0.05)
    cf = mouseX kr 100 20000 Exponential 0.2 -- center-frequency
    rq = mouseY kr 0.1 1 Linear 0.2 -- reciprocal of Q
in bLowPass i cf rq
