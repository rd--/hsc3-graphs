-- lfBrownNoise2
let freq = 1000
    dev = mouseX KR 0 1 Linear 0.2
    dist = mouseY KR 0 5 Linear 0.2
in X.lfBrownNoise2 'α' AR freq dev dist * 0.25
