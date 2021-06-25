// RDelaySet - three one second delays
{var s = SinOsc.ar(freq: MouseX.kr(minval: 110, maxval: 660, warp: 0, lag: 0.1), phase: 0, mul: MouseY.kr(minval: 0, maxval: 0.6, warp: 0, lag: 0.2))
;var d = RDelaySet.ar(in: s, spec: [1,1,1/5,2,1/2,1/10,3,1/3,1/15])
;[s,d]}
