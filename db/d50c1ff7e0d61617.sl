(* LfSaw ; mixed with sin, then with distortions *)
var f = XLine(220, 440, 10);
var o1 = SinOsc(f + [0, 0.7], 0);
var o2 = LfSaw (f + [0, 0.7], 0) * 0.3;
var o3 = o1 + o2;
o3.Distort.Distort.Cubed * 0.5
