(* https://sccode.org/1-4Qy ; f0 ; 0319 *)
let b = (1 .. 8);
let c = SinOscFb(b / 16 / 16.16, 0) % 1;
let f = b.withIndexCollect { :x :i |
	[x, i + 6 / 6000 + x]
} * 60;
let e = (SinOscFb([3, 6], 1) * (Lag(c, 0.1) / 3)).Max(0);
let o = (SinOscFb(f, c) * e);
o.Splay2.transposed.Mix
