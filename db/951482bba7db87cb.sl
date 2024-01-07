(* https://sccode.org/1-4Qy ; f0 ; 0334 *)
let b = (9 .. 1) * 4.0015;
let r = SinOsc(2 / b, 0) * 3;
let q = SinOsc(SinOsc(b / 8, 0) / 2 + (SinOsc(1 / 33, 0) > 0 + 8 * b), 0);
let ph = r + 4 ^ q * 6;
Splay(SinOsc(0, ph) * (4 ^ SinOsc(1/b, b)).Tanh / 2)
