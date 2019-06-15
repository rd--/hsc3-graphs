{var lwr = 48
;var flwr = lwr.midicps
;var spart = {arg t
              ;{var n = LFNoise2.kr(0.1).range(lwr,72.0)
               ;var e = Decay2.kr(t,0.01,TRand.kr(0.05,0.75,t))
               ;var x = WhiteNoise.ar * e
               ;var m = LFNoise2.kr(0.1)
               ;var f = Lag.kr(n.midicps,0.25)
               ;CombC.ar(x,flwr.reciprocal,f.reciprocal,m.range(1,8))}}
;var t = Dust.kr([0.75,0.35])
;Mix.fill(12,spart.(t)) * 0.1}.play
