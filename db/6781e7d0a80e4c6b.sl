(* Seq ; at audio rate ; mouse control *)
var n = Dseq(inf, [1 3 2 7 8 32 16 18 12 24]);
var x = MouseX(1, 10000, 1, 0.1);
var t = Impulse(x, 0);
var f = Demand(t, 0, n) * 30 + 340;
SinOsc(f, 0) * 0.1
