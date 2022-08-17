//--tweet0321
a=SinOsc;c=a.ar(b=(1..6)*60,LocalIn.ar(6)*3);LocalOut.ar(Limiter.ar(BPF.ar(c,a.ar(16/b)+3*b),0.66,16/b));Splay ar:c/2
