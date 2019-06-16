// data space (jmcc) #2

"overlap-texture.scd".loadRelative;

~overlap_texture.(
{var dt = 0.25.rand + 0.1
;var osc =
  {arg n
  ;var e = LFPulse.kr(4.0.rand, 0, 1.0.rand, 8000.rand, 2000.rand)
  ;LFPulse.kr(n.rand, 0, 1.0.rand, e)}
;var freq = osc.(200) + osc.(20) + osc.(20)
;CombL.ar(Pan2.ar(LFPulse.ar(freq, 0, 0.5, 0.04), LFNoise0.kr(3.0.rand, 0.8)), dt, dt, 3)}
,sustainTime:6, transitionTime:1, overlap:4)