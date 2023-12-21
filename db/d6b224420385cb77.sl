(* DustRange ; velvet noise (approx.) *)
var iot = 20 / SampleRate();
var x = MouseX(1, 16, 1, 0.1);
var d = DustRange(iot / x, iot * x);
var s = TRand(-1, 1, d);
Trig(d, SampleDur()) * s.Sign * 0.1
