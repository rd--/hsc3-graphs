// harmonic swimming (jmcc) #1
val a = 0.02
val f = 50
val p = 20
val l = Line.kr(0, -0.02, 60, doneAction = freeSelf)
val o = (i:Int) => {
  val n = LFNoise1.kr(Seq.apply(Rand.apply(2, 10), Rand.apply(2, 10))).mulAdd(a, l).max(0)
  FSinOsc.ar(f * (i + 1), 0) * n }
Mix.tabulate(p)(o)
