(* LocalOut ; ping pong *)
let n = Decay(Impulse(0.3, 0), 0.1) * PinkNoise() * 0.2;
let l = LocalIn(2, 0) + [n, 0];
let d = DelayN(l, 0.2, 0.2);
d <! LocalOut(d.reversed * 0.8)
