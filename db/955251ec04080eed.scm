; linen
(let ((e (Linen (Impulse kr 2 0) 0.01 0.1 0.4 doNothing)))
  (Mul (SinOsc ar 440 0) e))
