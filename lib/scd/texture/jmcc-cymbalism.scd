// cymbalism (jmcc) #2
RTexture.xfade(
{var p = 15
;var f1 = Rand(500,2500)
;var f2 = Rand(0,8000)
;var y = {var f = Array.fill(p,{f1 + Rand(0,f2)})
         ;var rt = Array.fill(p,{1 + Rand(0,4)})
         ;`[f,nil,rt]}
;var z = Array.fill(2,y)
;var t = Impulse.ar(Rand(0,3) + 0.5,0)
;var n = WhiteNoise.ar * 0.03
;var s = Decay.ar(t,0.004) * n
;Klank.ar(z,s)},4,4)
