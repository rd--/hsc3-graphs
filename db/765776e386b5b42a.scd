// sc-140 ; 19 ; MCLD
var a = [0.02, 0.1, 1, 2, 3, 4];
var k=LFPar.kr(a + 0.5, 0).sum;
var f=Latch.kr(k, Impulse.kr(a, 0));
Splay.ar(SinOsc.ar(f * 100 + 300, 0) / 5)
