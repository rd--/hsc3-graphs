// f0 ; https://twitter.com/redFrik/status/1105496695637454848
var b = (1 .. 15) / 151;
var w = (VarSaw.kr(b, b, 1 / 5.15) * 1 + 1.5).ceil;
var s = Select.kr((VarSaw.kr(1/15, 1/5, b) * 5).ceil + 5 / 5, [51 * 1.5, 51, 151]);
var x = Lag.kr(s, b);
var y = VarSaw.kr(5 + b, 0, 0.5);
var z = VarSaw.kr(b, b, b) * b / 5 + [1.5, 5, 1];
var m = VarSaw.kr(5 - b, b, b) * 5 + 5;
var o = VarSaw.ar(w * x + y * z, b, VarSaw.kr(b, 0, 0.5) + 5 / 15) * (m > 1.515);
var f = 1515 ** (VarSaw.kr(1 - b / 5, 0, 0.5) / 15 + 1 + b);
var rq = 1.5 ** VarSaw.kr(b, 0, 0.5) / 5;
Splay.ar(BLowPass.ar(o, f, rq) / 5)
