-- balance2
let l = lfSaw ar 44 0
    r = pulse ar 33 0.5
    p = fSinOsc kr 0.5 0
in balance2 l r p 0.1
