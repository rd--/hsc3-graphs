// strummable silk (jmcc) #11

{var mousex = MouseX.kr
;var out = Mix.arFill(8,
 {arg i
 ;var n = 15
 ;var trigger = HPZ1.kr(mousex > (0.25 + (i * 0.07))).abs
 ;var pluck = PinkNoise.ar(Decay.ar(Impulse.ar(14,0,Lag.kr(Trig.kr(trigger,1),0.2,0.01)),0.04))
 ;var freq = ([-2,0,3,5,7,10,12,15].at(i) + 60).midicps
 ;var z = [Array.fill(n,{ arg j; (j+1) * freq } ),nil,Array.fill(n,{ rrand(0.3,1.0) })]
 ;var metal = Klank.ar(`z,pluck)
 ;Pan2.ar(metal,i * 0.2 - 0.5)})
;out = LeakDC.ar(LPF.ar(out,12000))
;6.do({out = AllpassN.ar(out,0.1,[0.05.rand,0.05.rand],4)}) // rvb
;out}.play
