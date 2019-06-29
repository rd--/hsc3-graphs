// <https://twitter.com/sluyterrific_sc/status/570012853274615808> (es)

{var t = Dust2.ar(9!2)
;var n = LFNoise2
;var o = 0.1
;var a = n.ar(o,9,9)
;var s = VarSaw.ar(TExpRand.ar(9,5e3,t)) * Decay.ar(t)
;Greyhole.ar(s,a,0,o,n.ar(1),n.ar(1,1,1),2,a)}.play
