(* Osc ; sineTable *)
var c = 4096.sineTable(1 / (1 .. 3), [0]).normalize.asWavetable.asLocalBuf;
Osc(c, MouseX(222, 555, 1, 0.2), 0) * 0.1
