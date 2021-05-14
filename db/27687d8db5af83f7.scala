// tw 0121 (f0)
val z = SinOsc.kr(GESeq.apply(8,7).reciprocal, 0) * SinOsc.kr(1.0 / 30.0,0) * 9;
val l = Seq.apply(56,62,68,74,80,86,92,98);
val m = SinOsc.ar(GESeq.apply(4,3).reciprocal, 0);
val o = SinOsc.ar(Select.kr(z,l).midiCps,0) * m;
CombN.ar(o,1,GESeq.apply(6,5).reciprocal,9).tanh * 0.2
