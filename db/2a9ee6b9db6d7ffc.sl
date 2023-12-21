(* https://scsynth.org/t/6452 ; rd edit *)
var k = 8;
var tr = Impulse(Line(1, 50, 30), 0);
GrainFm(
	8,
	tr,
	TRand(1, 10, tr),
	TRand(322, 3222, tr),
	TRand(322, 3222, tr),
	1,
	TRand(-1, 1, tr),
	-1,
	2048)
.Splay / 99
