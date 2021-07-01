-- lfBrownNoise2 ; as pan & volume controls ; warning=feedback
let s = soundIn 0
    freq = range 0.5 2 (X.lfBrownNoise2Id 'α' kr 2 0.1 5)
    dev = mouseX kr 0.01 0.35 Linear 0.2
    dist = mouseY kr 0 5 Linear 0.2
    n1:n2:_ = map (\z -> X.lfBrownNoise2Id z kr freq dev dist) ['β'..]
in pan2 s (range (-0.75) 0.75 n1) 1 * range 0.01 0.5 n2
