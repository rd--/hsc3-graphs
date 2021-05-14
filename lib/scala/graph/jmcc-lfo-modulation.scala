// lfo modulation (jmcc) #1
val o = FSinOsc.kr(0.05, 0).mulAdd(80, 160)
val p = FSinOsc.kr(Seq.apply(0.6, 0.7), 0).mulAdd(3600, 4000)
val s = RLPF.ar(LFPulse.ar(o, 0, 0.4) * 0.05, p, 0.2)
CombL.ar(s, 0.3, Seq.apply(0.2, 0.25), 2)
