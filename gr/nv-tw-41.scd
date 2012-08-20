play{
x=Splay.ar({|i|
t=0.6**i*40*Impulse.ar(2**i/32,1/2);
f=4**LFNoise0.kr(1/16)*300;
RLPF.ar(t,f,5e-3).sin}!8);
2.do{x=FreeVerb2.ar(*x++[0.1,1,1])};
x}
