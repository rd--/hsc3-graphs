// scratchy (jmcc) #1
val n = BrownNoise.ar(Seq.apply(0.5, 0.5)) - 0.49
val f = n.max(0) * 20
RHPF.ar(f, 5000, 1)
