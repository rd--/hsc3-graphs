-- add (+)
let o = fSinOsc AR 800 0
    n = pinkNoise 'α' AR
in (o + n) * 0.1
