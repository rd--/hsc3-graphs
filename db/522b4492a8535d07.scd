// https://recarteblog.wordpress.com/2021/05/05/gongfm_sc/ ; or ; edit
var dur = 7;
var tr = Impulse.kr(1 / dur, 0);
var ratio1 = TRand.kr(0.49, 1.11, tr); // 0.9
var ratio2 = TRand.kr(0.17, 0.55, tr); // 0.55
var ratio3 = TRand.kr(0.34, 1.35, tr); // 1.03
var index2 = TRand.kr(1.33, 2.00, tr); // 2
var index3 = TRand.kr(3.29, 5.06, tr); // 4
var amp = 0.7;
var pan = 0;
var env3 = LinSeg.kr(tr, [0, 0.4,   1, 0.3, 1, dur,       0]);
var env2 = LinSeg.kr(tr, [0, 0,     1, 0.3, 1, dur,       0]);
var env1 = LinSeg.kr(tr, [0, 0.003, 1, 0.3, 1, dur - 0.5, 0]);
var op3 = SinOsc.ar([67, 70, 74].midicps * ratio3, 0) * [67, 70, 74].midicps * ratio3 * index3 * env3;
var op2 = SinOsc.ar([67, 70, 74].midicps * ratio2 + op3, 0) * [67, 70, 74].midicps * ratio2 * index2 * env2;
var op1 = SinOsc.ar([67, 70, 74].midicps * ratio1 + op2, 0);
var sig = Splay.ar(op1 * env1 * amp);
Balance2.ar(sig[0], sig[1], pan)
