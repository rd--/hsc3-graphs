(* Bezier ; mouse control of frequency *)
var x = MouseX(40, 4000, 1, 0.2);
Bezier(100, 0.001, x, 0, [0, 0, 0.2, -1.3, 0.3, -1.3, 0.5, 0, 0.7, 1.3, 0.8, 1.3, 1, 0]) * 0.1
