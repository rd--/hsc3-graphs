(* TRand ; array input *)
var tr = Dust([5, 12]);
var f = TRand([200, 1600], [500, 3000], tr);
SinOsc(f.Lag(0.07), 0) * TRand(0.01, 0.15, tr).Lag2(0.02)
