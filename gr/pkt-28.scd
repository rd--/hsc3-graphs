// http://www.fredrikolofsson.com/f0blog/?q=node/490

{n = 28
;x =
 {arg i
 ;a = LFSaw.ar(i + 1 * 5,0,0.5 * pi)
 ;b = SinOsc.ar(i + 1 * 0.001,0,0.5)
 ;c = LFSaw.ar(0.2 + b,i / n,0.4).max(0)
 ;d = SinOsc.ar(0.03,i + 1,0.5,1)
 ;e = SinOsc.ar(200 + i,0,d)
 ;f = SinOsc.ar(0.04,i + 2,0.5,1)
 ;g = SinOsc.ar(400 + i,0,f)
 ;h = SinOsc.ar(0.05,i + 3,0.5,1)
 ;j = SinOsc.ar(800 + i,0,h)
 ;k = i.linexp(0,n - 1,70,1500)
 ;z = SinOsc.ar(k,a,c)* e * g * j
 ;l = i.linlin(0,n - 1,-0.925,0.925)
 ;Pan2.ar(z,l,1 / n)}
;y = Limiter.ar(LeakDC.ar(Mix(x ! n)))
;GVerb.ar(y,3,5,0.2,0.8,20,0.1)}.play
