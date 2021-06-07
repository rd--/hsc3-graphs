; vibrato ; compare, k-rate freq input can be a constant
(let ((v (Vibrato kr 400 1 0.02 0 0 0.04 0.1 0 0)))
  (Mul (SinOsc ar v 0) 0.1))
