-- dynKlank
let s = klankSpec [200,671,1153,1723] [1,1,1,1] [1,1,1,1]
in dynKlank (pinkNoise 'α' AR * 0.004) 1 0 1 s
