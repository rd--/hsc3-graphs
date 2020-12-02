-- lfBrownNoise2 ; as pan & volume controls ; warning=feedback
let s = soundIn 0
    freq = range 0.5 2 (X.lfBrownNoise2 'α' KR 2 0.1 5)
    dev = mouseX KR 0.01 0.35 Linear 0.2
    dist = mouseY KR 0 5 Linear 0.2
    n1:n2:_ = map (\z -> X.lfBrownNoise2 z KR freq dev dist) ['β'..]
in pan2 s (range (-0.75) 0.75 n1) 1 * range 0.01 0.5 n2
