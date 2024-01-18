{- https://sccode.org/1-4Qy ; f0 ; 0342 -}
let b = (1 .. 8) / 128;
let c = LfSaw(b, 0) % 1;
let f = (2 ^ LfSaw(b, 0) * 256).RoundTo(64);
let e = Rlpf(LfSaw(1 / b / 32, 0), 500, 1.01 - c);
let o = SinOscFb(f, c) * e;
Clip(o, 0, 1).Splay / 2
