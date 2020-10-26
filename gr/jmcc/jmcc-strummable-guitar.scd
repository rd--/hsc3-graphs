// strummable guitar (jmcc) #11

{var scale = [52,57,62,67,71,76]
;var str =
  {arg i
  ;var x = MouseX.kr(0,1,'linear',0.2)
  ;var t = HPZ1.kr(x > (0.25 + (i * 0.1))).abs
  ;var e = Decay.kr(t,0.05)
  ;var n = PinkNoise.ar * e
  ;var dt = scale.at(i).midicps.reciprocal
  ;var s = CombL.ar(n,dt,dt,4)
  ;Pan2.ar(s,i * 0.2 - 0.5,1)}
;var strs = Mix.fill(scale.size,str)
;LeakDC.ar(LPF.ar(strs,12000),0.995)}.play

// bidirectional strummable guitar (jmcc) #11

{var pitch1 = [52,57,62,67,71,76]
;var pitch2 = pitch1 + 7
;var mousex = MouseX.kr
;var out = Mix.arFill(pitch1.size,
 {arg i
 ;var trigger = HPZ1.kr(mousex > (0.25 + (i * 0.1)))
 ;var pluck1 = PinkNoise.ar(Decay.kr(trigger.max(0),0.05))
 ;var period1 = pitch1.at(i).midicps.reciprocal
 ;var string1 = CombL.ar(pluck1,period1,period1,4)
 ;var pluck2 = BrownNoise.ar(Decay.kr(trigger.neg.max(0),0.05))
 ;var period2 = pitch2.at(i).midicps.reciprocal
 ;var string2 = CombL.ar(pluck2,period2,period2,-4)
 ;Pan2.ar(string1 + string2,i * 0.2 - 0.5)})
;LeakDC.ar(LPF.ar(out,12000))}.play
