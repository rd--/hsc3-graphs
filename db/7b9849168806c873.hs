-- dynKlank
let s = klankSpec [800,1071,1153,1723] [1,1,1,1] [1,1,1,1]
in dynKlank (impulse ar 2 0 * 0.1) 1 0 1 s
