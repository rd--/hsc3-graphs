// uplink (jmcc) #2 ; texture=overlap,4,1,5,inf
{var osc, freq, sig
;osc =
  {var e
  ;e = LFPulse.kr(freq: Rand.ir(lo: 0, hi: 4), iphase: 0, width: Rand.ir(lo: 0, hi: 1)) * Rand.ir(lo: 0, hi: 8000) + Rand.ir(lo: 0, hi: 2000)
  ;LFPulse.kr(freq: Rand.ir(lo: 0, hi: 20), iphase: 0, width: Rand.ir(lo: 0, hi: 1)) * e}
;freq = osc.value + osc.value
;sig = LFPulse.ar(freq: freq, iphase: 0, width: 0.5) * 0.04
;Pan2.ar(in: sig, pos: Rand.ir(lo: 0, hi: 0.8), level: 1)}
