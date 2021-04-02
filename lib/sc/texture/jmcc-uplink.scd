// uplink (jmcc) #2
RTexture.overlap(
{var osc =
  {var e = LFPulse.kr(4.0.rand, 0, 1.0.rand) * 8000.rand + 2000.rand
  ;LFPulse.kr(20.0.rand, 0, 1.0.rand) * e}
;var freq = osc.value + osc.value
;Pan2.ar(LFPulse.ar(freq, 0, 0.5) * 0.04, 0.8.rand2)}
,4,1,5)
