-- saucer base (jmcc) #6 ; texture=overlap,2,6,4,inf
let b = rand 0 1000
    c = rand 0 5000
    o = sinOsc ar (sinOsc ar (rand 0 20) 0 * b + (1.1 * b)) 0 * c + (1.1 * c)
in pan2 (sinOsc ar o 0 * 0.1) (rand2 1) 1
