{- TRand ; array input -}
let tr = Dust([5, 12]);
let f = TRand([200, 1600], [500, 3000], tr);
SinOsc(f.Lag(0.07), 0) * TRand(0.01, 0.15, tr).Lag2(0.02)
