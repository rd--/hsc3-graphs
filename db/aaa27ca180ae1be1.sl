;; http://earslap.com/article/sctweeting.html ; wait to start
var f = LocalIn(2, 0).Tanh;
var k = Latch(f.first.Abs, Impulse(0.5, 0));
f <! LocalOut(f + AllpassN(Pulse([2, 3], k * 0.01 + 0.000001) * 0.9, 1, k * 0.3, 100 * k))
