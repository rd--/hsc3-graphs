-- lfBrownNoise2
let freq = 1000
    dev = mouseX kr 0 1 Linear 0.2
    dist = mouseY kr 0 5 Linear 0.2
in X.lfBrownNoise2Id 'α' ar freq dev dist * 0.25
