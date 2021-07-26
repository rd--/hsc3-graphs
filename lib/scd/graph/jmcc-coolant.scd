// coolant (jmcc)
{var p = 10
;var s1 = [Array.fill(p, {40 + 2000.0.rand}),nil,nil]
;var s2 = [Array.fill(p, {40 + 2000.0.rand}),nil,nil]
;Klank.ar([Ref.new(s1),Ref.new(s2)],OnePole.ar(BrownNoise.ar([0.002,0.002]),0.95))}
