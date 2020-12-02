-- tBrownRand
let t = dust 'α' KR 10
    dist = mouseX KR 0 5 Linear 0.2
    f = X.tBrownRand 'β' 300 3000 1 dist t
in sinOsc AR f 0 * 0.1
