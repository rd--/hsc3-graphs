-- rand
let f = randId 'α' 200 1200
    l = randId 'β' (-1) 1
    e = line kr 0.2 0 0.1 RemoveSynth
    o = fSinOsc ar f 0
in pan2 (o * e) l 1
