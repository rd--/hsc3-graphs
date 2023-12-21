(* LocalOut ; ping pong *)
var n = Decay(Impulse(0.3, 0), 0.1) * PinkNoise() * 0.2;
var l = LocalIn(2, 0) + [n, 0];
var d = DelayN(l, 0.2, 0.2);
var o = LocalOut(d.reversed * 0.8);
d <! o
