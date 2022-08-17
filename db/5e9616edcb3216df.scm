; Linen ; kr only ; requires kr gate
(let ((e (Linen (kr: (Impulse 2 0)) 0.01 0.1 0.4 doNothing)))
  (Mul (SinOsc 440 0) e))
