; neg
(let ((s (SinOsc ar 440 0)))
  (mce2 (Mul s 0.1)
        (Add s (Neg s))))
