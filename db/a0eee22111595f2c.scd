// http://sccode.org/1-V (nv) L1
{a=PinkNoise.ar(1!2);50.do{a=BBandStop.ar(a,LFNoise1.kr(0.05.rand).exprange(40,15000),exprand(0.1,2))};LPF.ar(a,1e5)}
