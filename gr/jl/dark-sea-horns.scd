{var n = LFNoise1
;var x = LocalIn.ar(2)
;var a = SinOsc.ar(65,x*n.ar(0.1,3),n.ar(3,6)).tanh
;9.do{a=AllpassL.ar(a,0.3,{0.2.rand+0.1}!2,5)}
;a = a.tanh
;LocalOut.ar(a)
;a}.play

n=LFNoise1;
Ndef(\x,{
a=SinOsc.ar(65,Ndef(\x).ar*n.ar(0.1,3),n.ar(3,6)).tanh;
9.do{a=AllpassL.ar(a,0.3,{0.2.rand+0.1}!2,5)};
a.tanh}).play
