// inharmonic warbulence (jmcc) #12
RTexture.overlap(
{var f = rrand(24,96).midicps
;var a = min(1,500/f)
;var r = XLine.kr(exprand(0.1,20),exprand(0.1,20),25.6)
;var n = 12
;a * Mix.arFill(n,
 {arg i
 ;var g = n.asFloat.rand + 1
 ;var m = SinOsc.kr(r * rrand(0.9,1.1),2pi.rand,0.08,-0.04).max(0)
 ;Pan2.ar(FSinOsc.ar(f * g,0,m) * (2/g),1.0.rand2)})}
,12.8,6.4,6,2,postProcess:
{arg signal
;Mix.arFill(5,{CombN.ar(signal,0.3,[rrand(0.1,0.3),rrand(0.1,0.3)],8)}) * 0.3})

