// bowed string (jmcc)
{ var root = 5
; var scale = #[0,2,4,5,7,9,11] + root
; var oct = #[24,36,48,60,72,84]
; var f = (scale.choose + oct.choose).midicps
; var n0 = BrownNoise.ar.dup
; var r0 = ExpRand(0.125,0.5)
; var n1 = LFNoise1.kr(r0)
; var r1 = Rand(0.7,0.9)
; var r2 = Array.fill(12,{ Rand(1.0,3.0) })
; var x = n0 * 0.007 * max(0,n1 * 0.6 + 0.4)
; var d = `[Array.series(12,f,f),Array.geom(12,1,r1),r2]
; var k = Klank.ar(d,x)
; (k * 0.1).softclip }