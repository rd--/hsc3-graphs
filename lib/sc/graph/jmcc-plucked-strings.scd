// plucked strings (jmcc)
{var dt = {1 / rrand(60,90).floor.midicps}
;var i =
  {var s0 = Impulse.ar(rrand(2,2.2),0,0.3)
  ;var s1 = Dust.ar(0.5) * 0.3
  ;var s2 = Impulse.ar(SinOsc.kr(rrand(0.05,0.15),rrand(0,pi * 2)) * 5 + 5.2,0) * 0.3
  ;[s0,s1,s2].choose}
;var s =
  {var dt_ = dt.()
  ;var t = Decay.ar(i.(),0.1) * PinkNoise.ar * 0.1
  ;Pan2.ar(CombL.ar(t,dt_,dt_,4),rrand(-1,1),1)}
;Mix.fill(5,s)}.play
