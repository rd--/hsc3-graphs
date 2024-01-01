var i = Dust([2, 3]);
var tr = Trig1(i, TRand([0.1, 0.01], 0.35, i));
var f = TExpRand([220, 550], 880, tr);
var a = TExpRand([0.1, 0.01], 0.25, tr);
tr * SinOsc(f, 0) * a
