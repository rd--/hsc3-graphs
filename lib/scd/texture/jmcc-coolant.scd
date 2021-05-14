// coolant (jmcc) #2
RTexture.overlap(
{var p = 10
;var f = [`[Array.fill(p, { 40 + 2000.0.rand }),nil,nil],
          `[Array.fill(p, { 40 + 2000.0.rand }),nil,nil]]
;Klank.ar(f,OnePole.ar(BrownNoise.ar([0.002,0.002]),0.95))
},sustainTime:4,transitionTime:4,overlap:2)
