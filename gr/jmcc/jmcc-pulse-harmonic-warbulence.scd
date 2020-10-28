// pulse harmonic warbulence (jmcc) #12
Texture.overlap(
{var f = rrand(24,96).midicps
;var r = XLine.kr(exprand(0.1,20),exprand(0.1,20),25.6)
;var n = 12
;var p = LFPulse.kr(exprand(0.2,1.2),rrand(0.1,0.2))
;Mix.arFill(n,
 {arg i
 ;var m = SinOsc.kr(r * rrand(0.9,1.1),2pi.rand,0.1,-0.05).max(0)
 ;Pan2.ar(FSinOsc.ar(f * i + f,0,m) * (1/(i+1)),1.0.rand2)}) * p}
,12.8,6.4,6,2,postProcess:
{arg z
;Mix.arFill(5,{CombN.ar(z,0.3,[rrand(0.1,0.3),rrand(0.1,0.3)],8)}) * 0.5})
