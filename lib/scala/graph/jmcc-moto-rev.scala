// moto rev (jmcc) #1
val f = SinOsc.kr(0.2).mulAdd(10, 21)
val s = LFPulse.ar(f, Seq.apply(0, 0.1), 0.1)
RLPF.ar(s, 100, 0.1).clip2(0.4)
