// eggcrate ; rd
{var eggcrate, p, x, y, t, f0, f1, f, a
;eggcrate = {arg u, v; (u * pi).cos * (v * pi).sin}
;p = [64,72,96,128,256,6400,7200,8400,9600]
;x = BrownNoise.kr
;y = BrownNoise.kr
;t = Dust.kr(2.4)
;f0 = TChoose.kr(t,p)
;f1 = TChoose.kr(t,p)
;f = LinLin.kr(eggcrate.value(x,y),-1,1,f0,f1)
;a = LinLin.kr(x,-1,1,0,0.1)
;Pan2.ar(Mix.ar(SinOsc.ar(f,0)),y,a)}
