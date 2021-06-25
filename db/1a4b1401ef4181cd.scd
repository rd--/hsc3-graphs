// RDelaySet - delay memory is allocated with rtalloc, adjust to observe allocation failure
{var d = 10
;var s = SinOsc.ar(freq: MouseX.kr(minval: 110, maxval: 660, warp: 0, lag: 0.1), phase: 0, mul: MouseY.kr(minval: 0, maxval: 0.6, warp: 0, lag: 0.2))
;[s,RDelaySet.ar(in: s, spec: [d,1,1/5])] * 0.1}
