(* GrainSin *)
var k = 8;
var overlap = MouseY(0, 2, 0, 0.2);
var f = MouseX(1, 220, 0, 0.2);
var tr = Impulse(f, 0);
var a = GrainSin(k, tr, overlap / f, 440, TRand(-1, 1, tr), -1, 512).Splay;
LeakDc(a, 0.995) * 0.1
