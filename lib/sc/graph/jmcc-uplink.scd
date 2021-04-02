// uplink (jmcc) #2 ; texture=overlap,4,1,5,inf
{var osc =
  {var e = LFPulse.kr(Rand(0,4), 0, Rand(0,1)) * Rand(0,8000) + Rand(0,2000)
  ;LFPulse.kr(Rand(0,20), 0, Rand(0,1)) * e}
;var freq = osc.value + osc.value
;Pan2.ar(LFPulse.ar(freq, 0, 0.5) * 0.04, Rand(0,0.8))}
