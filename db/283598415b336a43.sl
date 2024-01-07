(* https://sccode.org/1-4Qy ; f0 ; 0281 *)
let b = 2 / (2 .. 9);
let o = LfCub(b, 0) % LfCub(b / 5, 0);
let p = b * [300 303] - Lag2(LfCub(b / 9, 0) > 0 * 50, 0.1);
let q = LfCub(2 ^ LfCub(b / 8, 0) > 0 + 1 * 2 * p, 0);
let r = LfCub(b / 6, b);
(o * q * r).Splay
