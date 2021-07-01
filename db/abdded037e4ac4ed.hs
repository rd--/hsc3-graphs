-- tBrownRand
let t = dustId 'α' kr 10
    dist = mouseX kr 0 5 Linear 0.2
    f = X.tBrownRandId 'β' 300 3000 1 dist t
in sinOsc ar f 0 * 0.1
