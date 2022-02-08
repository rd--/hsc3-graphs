// http://sccode.org/1-V (nv) L1
{var a = {PinkNoise.ar}.dup
;var o =
 {var f = LFNoise1.kr(freq: 0.05.rand).exprange(lo: 40, hi: 15000)
 ;a = BBandStop.ar(in: a, freq: f, bw: ExpRand.ir(lo: 0.1, hi: 2))}
;50.do(o)
;LPF.ar(in: a, freq: 100000)}
