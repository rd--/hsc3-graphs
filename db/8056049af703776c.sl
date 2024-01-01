(* quadratic noise *)
var a = LfNoise2(2);
(* first derivative produces line segments *)
var b = Slope(a);
(* second derivative produces constant segments *)
var c = Slope(b);
(* needed to scale back to +/- 1.0 *)
var scale = 0.2;
var freq = [a, b * scale, c * scale.squared] * 100 + 200;
SinOsc(freq, 0).Splay * 0.1
