(* http://earslap.com/article/sctweeting.html *)
var a = LocalIn(1, 0);
var x = SinOsc((Decay(Impulse([4, 4.005], 0), 1000 * a.Abs) * 50), a).Distort;
x <! LocalOut(x.Sum)
