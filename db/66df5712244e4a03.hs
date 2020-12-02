-- lfBrownNoise2 ; as frequency control
let freq = 8
    dev = mouseX KR 0 1 Linear 0.2
    dist = mouseY KR 0 5 Linear 0.2
    n1:n2:n3:_ = map (\z -> X.lfBrownNoise2 z KR freq dev dist) ['α'..]
    o = impulse AR (range 6 24 n1) 0
in lagUD o (range 0.0001 0.001 n2) (range 0.0001 0.001 n3) * 0.5
