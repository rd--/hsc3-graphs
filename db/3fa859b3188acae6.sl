(* LfGauss *)
let h = [100 800 3000].atRandom;
let o = { SinOsc(60.ExpRand(h), 0) * 0.1 } ! 40;
Splay(o) * LfGauss(6, 0.5, 0, 0, 0)
