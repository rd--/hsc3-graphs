; neg
(let ((s (SinOsc 440 0)))
  (Mce2 (Mul s 0.1)
        (Add s (Neg s))))
