// reverberated sine percussion (jmcc) #3
val d = 6
val c = 5
val a = 4
val s = Mix.fill(d)(Resonz.ar(Dust.ar(2.0 / d) * 50, Rand.apply(200, 3200), 0.003))
val z = DelayN.ar(s, 0.048, 0.048)
val y = Mix(CombL.ar(z, 0.1, LFNoise1.kr(Seq.fill(c)(Rand.apply(0, 0.1))).mulAdd(0.04, 0.05), 15))
val x = Mix.fold(y, a)(in => AllpassN.ar(in, 0.050, Seq.apply(Rand.apply(0, 0.050), Rand.apply(0, 0.050)), 1))
s + 0.2 * x
