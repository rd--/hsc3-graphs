-- balance2
let l = lfSaw AR 44 0
    r = pulse AR 33 0.5
    p = fSinOsc KR 0.5 0
in balance2 l r p 0.1
