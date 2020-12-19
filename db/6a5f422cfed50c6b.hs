-- tBall ; x = step noise modulation rate ; y = gravity
let sf = lfNoise0 'α' AR (mouseX KR 0.5 100 Exponential 0.2)
    g = mouseY KR 0.01 10 Exponential 0.2
    t = tBall AR sf g 0.01 0.002
in ringz (t * 4) (mce2 600 645) 0.3
