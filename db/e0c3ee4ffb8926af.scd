//--tweet0329
a=SinOsc;LocalOut ar:c=a.ar(99,LocalIn.ar(9)*a.ar((1..9)/99-98,0,a.ar(97/round(a.ar(1/32)+2.2).lag)*pi));Splay ar:c/2
