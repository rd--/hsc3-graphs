(* quadratic noise *)
let a = LfNoise2(2);
(* first derivative produces line segments *)
let b = Slope(a);
(* second derivative produces constant segments *)
let c = Slope(b);
(* needed to scale back to +/- 1.0 *)
let scale = 0.2;
let freq = [a, b * scale, c * scale.squared] * 100 + 200;
SinOsc(freq, 0).Splay * 0.1
