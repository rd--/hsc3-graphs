// RDelaySet - a lot of random delays
{var s = SinOsc.ar(freq: MouseX.kr(minval: 110, maxval: 660, warp: 0, lag: 0.1), phase: 0, mul: MouseY.kr(minval: 0, maxval: 0.4, warp: 0, lag: 0.2))
;var n = 10
;var a = [Array.fill(n,{5.0.rand})
         ,Array.fill(n,{(1/5) + (4/5).rand})
         ,Array.fill(n,{(1/40) + (1/40).rand})]
;[s,RDelaySet.ar(in: s, spec: a.flop.flatten)]}
