// red frik (f0)
var n = {BrownNoise.ar}.dup(2);
var tr = Impulse.kr(0.1, 0);
var r1 = TRand.kr(0.3, 3, tr);
var r2 = TRand.kr(0.3, 5, tr);
var r3 = TRand.kr(0, 0.5, tr);
var r4 = TRand.kr(0.49, 0.56, tr);
var r5 = TRand.kr(0.3, 0.6, tr);
var r6 = TRand.kr(0.3, 0.5, tr);
var o1 = SinOsc.kr(r2, 0) * r3 + r4;
var o2 = SinOsc.kr(o1, 0) * r5 + r6;
RHPF.ar(n, r1, o2) * 0.1
