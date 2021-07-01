-- tBall ; x = step noise modulation rate ; y = gravity
let sf = lfNoise0Id 'α' ar (mouseX kr 0.5 100 Exponential 0.2)
    g = mouseY kr 0.01 10 Exponential 0.2
    t = tBall ar sf g 0.01 0.002
in ringz (t * 4) (mce2 600 645) 0.3
