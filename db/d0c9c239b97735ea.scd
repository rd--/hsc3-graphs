// pkt 28 (f0) - http://www.fredrikolofsson.com/f0blog/?q=node/490
{var n = 28
;var x =
 {arg i
 ;var a = LFSaw.ar(i + 1 * 5,0,0.5 * pi)
 ;var b = SinOsc.ar(i + 1 * 0.001,0,0.5)
 ;var c = LFSaw.ar(0.2 + b,i / n,0.4).max(0)
 ;var d = SinOsc.ar(0.03,i + 1,0.5,1)
 ;var e = SinOsc.ar(200 + i,0,d)
 ;var f = SinOsc.ar(0.04,i + 2,0.5,1)
 ;var g = SinOsc.ar(400 + i,0,f)
 ;var h = SinOsc.ar(0.05,i + 3,0.5,1)
 ;var j = SinOsc.ar(800 + i,0,h)
 ;var k = i.linexp(0,n - 1,70,1500)
 ;var z = SinOsc.ar(k,a,c)* e * g * j
 ;var l = i.linlin(0,n - 1,-0.925,0.925)
 ;Pan2.ar(z,l,1 / n)}
;var y = Limiter.ar(LeakDC.ar(Mix(x ! n)))
;GVerb.ar(y,3,5,0.2,0.8,20,0.1)}
