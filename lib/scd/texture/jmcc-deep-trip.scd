// deep trip (jmcc) #9
RTexture.overlap(
{var f = LFNoise1.kr(0.3.rand, 60, 70).midicps
;var a = LFNoise2.ar(f * 0.5.rand, LFNoise1.kr(8.0.rand, SinOsc.kr(40.0.rand, 0, 0.1)).max(0))
;var z = SinOsc.ar(f, 0) *  a
;var s = Pan2.ar(z, LFNoise1.kr(5.0.rand))
;var c1 = CombN.ar(s, 0.5, [0.2.rand + 0.3, 0.2.rand + 0.3], 20)
;var c2 = CombN.ar(s, 0.5, [0.2.rand + 0.3, 0.2.rand + 0.3], 20)
;s + c1 + c2}
,12,4,4)
