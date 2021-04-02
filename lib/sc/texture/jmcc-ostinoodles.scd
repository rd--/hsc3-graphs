// ostinoodles (jmcc) #9
(var sequ = {arg s,tr; Demand.kr(tr,0,Dseq(s,inf))}
;var root = 81 + 6.rand2
;var major = #[0,2,4,5,7,9,11]
;RTexture.overlap(
 {var offset = 16.rand2
 ;var sequence = (([0,1,2,3] + offset).scramble.degreeToKey(major) + root).midicps
 ;var trig = Impulse.kr(XLine.kr(exprand(4.0,24.0),exprand(4.0,24.0),12))
 ;var f = sequ.(sequence,trig)
 ;Pan2.ar(LFTri.ar(f,0,Decay2.kr(trig,0.004,0.3,0.1)),1.0.rand2)
},6,3,6,2,postProcess:
 {arg z
 ;6.do({z = AllpassN.ar(z,0.040,[0.040.rand,0.040.rand],16)})
 ;z}))
