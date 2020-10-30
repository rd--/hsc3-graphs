// alien meadow (jmcc) #6
{Texture.overlapGraph(
{arg tr
;var a = TRand.kr(0,20,tr)
;var b = TRand.kr(0,5000,tr)
;var c = TRand.kr(0,20,tr)
;var p = TRand.kr(-1,1,tr)
;var o1 = SinOsc.ar(a, 0) * (0.1 * b) +  b
;var o2 = SinOsc.kr(c, 0) * 0.05 + 0.05
;var o3 = SinOsc.ar(o1, 0, o2)
;Pan2.ar(o3, p)}, sustainTime:6, transitionTime:2, overlap:6)}
