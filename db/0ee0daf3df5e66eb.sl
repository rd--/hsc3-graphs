;; Seq ; at control rate
var n = Lseq(3, [1, 3, 2, 7, 8]);
var x = MouseX(1, 40, 1, 0.1);
var t = Impulse(x, 0);
var f = DmdOn(t, 0, n) * 30 + 340;
SinOsc(f.kr, 0) * 0.1
