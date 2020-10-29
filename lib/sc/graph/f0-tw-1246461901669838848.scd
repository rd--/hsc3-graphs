// https://twitter.com/redFrik/status/1246461901669838848
{var a = SinOscFB
;var b = LFPulse
;var c = ar(b,1/11,0,1/4,99,99)
;var o = ar(b,ar(b,1/[8,9]+ar(b,0.1)).lag(ar(a,1/11)/2+1/9)*4/3+1**ar(b,1/[9,8])*c)
;var d = ar(a,kr(Pitch,o.lag(ar(a,1/[5,4]).max/9).sum)[0],ar(b,1/[ar(b,1/9)+2,3]).lag/4+0.3)
;var e = ar(PitchShift,d/2,2,[3,2]-ar(b,1/[18,17]).lag)
;ar(HPF,d+e,9)/4}
