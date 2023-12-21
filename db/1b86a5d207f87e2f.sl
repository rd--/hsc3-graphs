(* Bezier ; mouse control of frequency & one control point *)
var x = MouseX(40, 4000, 1, 0.2);
var y = MouseY(0.1, 0.2, 0, 0.2);
Bezier(100, 0.001, x, 0, [0, 0, y, -1.3, 0.3, -1.3, 0.5, 0, 0.7, 1.3, 0.8, 1.3, 1, 0]) * 0.1
