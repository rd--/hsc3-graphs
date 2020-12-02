-- dynKlank
let s = klankSpec [800,1071,1353,1723] [1,1,1,1] [1,1,1,1]
in dynKlank (dust 'α' AR 8 * 0.1) 1 0 1 s
