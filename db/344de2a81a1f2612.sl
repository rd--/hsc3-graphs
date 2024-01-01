(* LocalIn ; read feedback, add to source *)
var source = Decay(Impulse(0.3, 0), 0.1) * WhiteNoise() * 0.2;
var local = LocalIn(2, [0 0]) + [source, 0];
var delayed = DelayN(local, 0.2, 0.2);
delayed <! LocalOut(delayed.reversed * MouseX(0, 1, 0, 0.2))
