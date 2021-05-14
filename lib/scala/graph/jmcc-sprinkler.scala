// sprinkler (jmcc) #1
val f = LFPulse.kr(0.09, 0, 0.16).mulAdd(10, 7)
val t = LFPulse.kr(f, 0, 0.25) * 0.1
BPZ2.ar(WhiteNoise.ar * t)
