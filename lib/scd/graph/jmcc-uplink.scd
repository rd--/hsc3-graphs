// uplink (jmcc) #2 ; texture=overlap,4,1,5,inf
{var osc, freq, sig
;osc =
  {var e
  ;e = LFPulse.kr(freq: Rand.new(lo: 0, hi: 4), iphase: 0, width: Rand.new(lo: 0, hi: 1)) * Rand.new(lo: 0, hi: 8000) + Rand.new(lo: 0, hi: 2000)
  ;LFPulse.kr(freq: Rand.new(lo: 0, hi: 20), iphase: 0, width: Rand.new(lo: 0, hi: 1)) * e}
;freq = osc.value + osc.value
;sig = LFPulse.ar(freq: freq, iphase: 0, width: 0.5) * 0.04
;Pan2.ar(in: sig, pos: Rand.new(lo: 0, hi: 0.8))}

// uplink (jmcc) #2 ; texture=overlap,4,1,5,inf
{var osc =
  {var e = LFPulse.kr(Rand(0,4), 0, Rand(0,1)) * Rand(0,8000) + Rand(0,2000)
  ;LFPulse.kr(Rand(0,20), 0, Rand(0,1)) * e}
;var freq = osc.value + osc.value
;Pan2.ar(LFPulse.ar(freq, 0, 0.5) * 0.04, Rand(0,0.8))}
