-- dynKlank
let s = klankSpec [800,1071,1353,1723] [1,1,1,1] [1,1,1,1]
in dynKlank (pinkNoise 'α' AR * 0.007) 1 0 1 s
