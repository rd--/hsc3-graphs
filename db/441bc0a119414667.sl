(* http://earslap.com/article/sctweeting.html *)
var f = LocalIn(2, 0).Tanh;
var k = Latch(f.first.Abs, Impulse(1 / 4, 0));
f <! LocalOut(f + CombC(Blip([4, 6], 100 * k + 50) * 0.9, 1, k * 0.3, 50 * f))
