(* coolant (jmcc) ; requires=filterMethods *)
{ BrownNoise().Mul(0.002).OnePole(0.95).RingzBank({ 40 + 2000.Rand } ! 10, [0.1], [1]) } ! 2
