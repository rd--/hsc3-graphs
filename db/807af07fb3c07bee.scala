// https://twitter.com/redFrik/status/456384156159574016
val n = Seq.apply(3,12,4,1,6,2).map(x => x.reciprocal);
val a = GE.fromFloatSeq(n);
val s = Lag3.ar(SinOsc.ar(n,0),SinOsc.ar(GE.const(2.67) pow n,0).abs) * 99;
val f = ((SinOsc.ar((1 / a) / 9, a) > 0) * 20 + 99) / a;
SplayAz.ar(2,SinOsc.ar(HPF.ar(Ringz.ar(s, f)),0)) * 0.25
