// sample and hold liquidities (jmcc) #4
{var r = MouseX.kr(1,200,'exponential',0.1)
;var t = r.reciprocal
;var c = Impulse.kr(r,0,0.4)
;var cf = MouseY.kr(100,8000,'exponential',0.1)
;var f = Latch.kr(WhiteNoise.kr * cf * 0.5 + cf,c)
;var p = Latch.kr(WhiteNoise.kr,c)
;var i = Pan2.ar(SinOsc.ar(f,0,Decay2.kr(c,0.1 * t,0.9 * t)),p,1)
;CombN.ar(i,0.3,0.3,2)}
