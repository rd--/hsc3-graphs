-- lfBrownNoise2 ; as frequency control
let freq = 8
    dev = mouseX kr 0 1 Linear 0.2
    dist = mouseY kr 0 5 Linear 0.2
    n1:n2:n3:_ = map (\z -> X.lfBrownNoise2Id z kr freq dev dist) ['α'..]
    o = impulse ar (range 6 24 n1) 0
in lagUD o (range 0.0001 0.001 n2) (range 0.0001 0.001 n3) * 0.5
