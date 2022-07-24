; AllpassC
(let ((z (Mul (WhiteNoise) 0.05)))
  (Add z (AllpassC z 0.01 (XLine 0.0001 0.01 20 doNothing) 0.2)))
