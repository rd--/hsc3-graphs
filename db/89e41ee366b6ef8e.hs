-- saucer base (jmcc) #6 ; texture=overlap,2,6,4,inf ; id
let a = randId 'α' 0 20
    b = randId 'β' 0 1000
    c = randId 'γ' 0 5000
    p = randId 'δ' (-1) 1
    o = sinOsc ar a 0 * b + (1.1 * b)
    o' = sinOsc ar o 0 * c + (1.1 * c)
in pan2 (sinOsc ar o' 0 * 0.1) p 1
