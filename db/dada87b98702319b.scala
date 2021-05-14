// analog bubbles (jmcc) #1
val f = LFSaw.kr(0.4, 0).mulAdd(24, LFSaw.kr(Seq.apply(8, 7.23), 0).mulAdd(3, 80)).midiCps;
CombN.ar(SinOsc.ar(f, 0) * 0.04, 0.2, 0.2, 4)
