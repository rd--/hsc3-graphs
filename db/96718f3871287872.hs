-- random sine waves (jmcc) #1 ; texture=overlap,2,5,12,inf ; id
let f = randId 'α' 0 2000
    o = fSinOsc ar f 0 * 0.02
in pan2 o (randId 'β' (-1) 1) 1
