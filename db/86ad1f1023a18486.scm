; AllpassN ; c.f. AllpassL and allpass-c
(let ((z (Mul (WhiteNoise ar) 0.05)))
  (Add z (AllpassN z 0.01 (XLine kr 0.0001 0.01 20 doNothing) 0.2)))
