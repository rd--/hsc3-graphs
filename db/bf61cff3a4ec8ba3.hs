-- sub (-)
let o = fSinOsc ar 800 0
    n = pinkNoiseId 'α' ar
in (o - n) * 0.1
