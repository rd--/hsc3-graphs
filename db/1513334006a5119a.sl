{- https://scsynth.org/t/6452 ; requires=SinGrain -}
let tr = Impulse(100 * Line(0.1, 10, 15), 0);
SinGrain(tr, 0.05, TRand(322, 3222, tr)) * 0.1
