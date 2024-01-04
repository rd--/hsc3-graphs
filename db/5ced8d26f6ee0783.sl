(* Coolant (Jmcc) ; Rand->rand *)
{ RingzBank(OnePole(BrownNoise() * 0.002, 0.95), { 40 + 2000.randomFloat } ! 10, [0.1], [1]) } ! 2
