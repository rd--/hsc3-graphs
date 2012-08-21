// http://www.fredrikolofsson.com/f0blog/?q=node/490 (f0)

{n = 8
;x =
 {arg i
 ;t = i/n
 ;a = VarSaw.ar(0.02, t, 0.5, 7.5).abs
 ;b = VarSaw.ar(0.16, t, 2/3, a, 300)
 ;c = VarSaw.ar(0.064, t, 0.5, 25, 50)
 ;d = VarSaw.ar(0.012, t, 0.75, c, 200)
 ;e = VarSaw.ar(0.024, t, 0.25, 0.475, 0.5)
 ;f = VarSaw.ar(100 + i, t, e)
 ;g = VarSaw.ar(0.048, 0, 0.5, 25, 150)
 ;h = VarSaw.ar(i + 1 * g, t, 1/3, 150)
 ;o = SinOsc.ar(h, f*pi, d, b)
 ;z = LeakDC.ar(VarSaw.ar(o, t))
 ;Pan2.ar(z, VarSaw.ar(0.02, t, 0.5), 1/n)}
;{Mix(x!n)}}.play
