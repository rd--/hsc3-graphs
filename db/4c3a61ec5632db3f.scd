// http://sccode.org/1-V (nv) L1
{var a = PinkNoise.ar(mul: 1 ! 2)
;50.do(
 {var f = LFNoise1.kr(freq: 0.05.rand).exprange(lo: 40, hi: 15000)
 ;a = BBandStop.ar(in: a, freq: f, bw: 0.1.exprand(2))})
;LPF.ar(in: a, freq: 100000)}
