; Resonz ; random Resonator at a random location
(let ((freq (Mul 120 (IRand 1 16)))
      (bw 1/4)
      (gain 8))
  (Pan2 (Resonz (WhiteNoise) freq (Fdiv bw freq))
        (Rand -1 1)
        gain))
