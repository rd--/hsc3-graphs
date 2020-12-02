// resonant dust (jmcc) #2 ; texture=spawn,2,inf
{var e = Env.linen(2, 5, 2)
;var rf1 = Rand(0,2000) + 80
;var rf2 = rf1 + (Rand(-0.5,0.5) * rf1)
;var d = Dust.ar(50 + Rand(0,800), 0.3)
;var s = Resonz.ar(d, XLine.kr(rf1, rf2, 9), 0.1)
;Pan2.ar(s, Rand(-1,1), EnvGen.ar(e, doneAction:2))}
