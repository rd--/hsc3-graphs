// eggcrate ; rd
{var eggcrate, p, x, y, t, f0, f1, f, a
;eggcrate = {arg u, v; (u * pi).cos * (v * pi).sin}
;p = #[64,72,96,128,256,6400,7200,8400,9600]
;x = BrownNoise.kr
;y = BrownNoise.kr
;t = Dust.kr(density: 2.4)
;f0 = TChoose.kr(trig: t, array: p)
;f1 = TChoose.kr(trig: t, array: p)
;f = LinLin.kr(in: eggcrate.value(x,y), srclo: -1, srchi: 1, dstlo: f0, dsthi: f1)
;a = LinLin.kr(in: x, srclo: -1, srchi: 1, dstlo: 0, dsthi: 0.1)
;Pan2.ar(in: Mix.ar(SinOsc.ar(freq: f, phase: 0)), pos: y, level: a)}
