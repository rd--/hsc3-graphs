-- dynKlang ; fixed
let s = klangSpec [800,1000,1200] [0.3,0.3,0.3] [pi,pi,pi]
in dynKlang ar 1 0 s * 0.4
