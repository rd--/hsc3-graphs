{- https://twitter.com/redFrik/status/1598714366483959809 -}
let b = [1 .. 9];
let l = SinOsc(9 ^ SinOsc(1 / 99, 0) / b, 0);
let p = LocalIn(9, 0);
let t = 1 - Amplitude(p, 0.01, 0.01).Lag(1 / 99);
let o = SinOsc(99 + l, l - t ^ SinOsc(t ^ 9 * 999 / b, 0) * 9) * t;
let v = 0.9 ^ 9;
(0 .. 2).do { :i |
	p := p.rotatedRight(1);
	o := o + CombC(p, 0.9, SinOsc(1 / b / 9, 0).Range(b ^ i / (99 + 9), b ^ i / 99), i + 1)
};
o := Hpf(o * l.Max(0) * v, 9).Tanh;
Splay(o * v) <! LocalOut(o)
