// FreqShift
{var a = Blip.ar(60,4,LFGauss.ar(4,1/8))
;var b = a / 4 + LocalIn.ar(2)
;var c = FreqShift.ar(b,LFNoise0.kr(1/4,90))
;LocalOut.ar(DelayC.ar(c,1,0.1,0.9))
;c}
