// 2006-09-27 (rd)
var e = Decay2.kr(Impulse.kr({Rand(10, 13)}.dup, 0), 0.001, 0.005);
var f = SinOsc.kr({Rand(10, 13)}.dup, 0) * e * {Rand(4, 7)}.dup;
var r4 = {TRand.kr(2220, 2227, Impulse.kr(0.7, 0))}.dup;
SinOsc.ar(r4, 0) * f * 0.25

//---- cricket
var r1 = Array.fill(2,{Rand(10,13)});
var r2 = Array.fill(2,{Rand(10,13)});
var r3 = Array.fill(2,{Rand(4,7)});
var t = Impulse.kr(0.7,0);
var e = Decay2.kr(Impulse.kr(r1,0),0.001,0.005);
var f = SinOsc.kr(r2,0) * e * r3;
var r4 = Array.fill(2,{TRand.kr(2220,2227,t)});
SinOsc.ar(r4,0) * f * 0.25
