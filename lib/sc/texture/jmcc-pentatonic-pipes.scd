// pentatonic pipes (jmcc) #9
(var n = 5
;var env = Env.linen(0.2,8,1,20,'sine')
;var mode = [0,3,5,7,10]
;var root = 36 + 12.rand
;Texture.overlap(
 {arg i
 ;var amp = EnvGen.kr(env)
 ;var f = nil
 ;var sig = nil
 ;if(i%20 == 0,{root = 36 + 12.rand; root.postln})
 ;f = (20.rand.degreeToKey(mode,12) + root).midicps
 ;sig = Resonz.ar(PinkNoise.ar(amp),f,0.002,4).distort * 0.2
 ;Pan2.ar(sig,1.0.rand2)}
,10,0.01,n,2,postProcess:
 {arg z
 ;z = z * LinXFade2.kr(1.0,SinOsc.kr(5).max(0),MouseX.kr > 0.5) // pulsing
 ;CombN.ar(z,0.3,0.3,8,1,z.reverse)}))
