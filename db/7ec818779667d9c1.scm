; vibrato ; at 1 Hz, note the use of DC.ar
(let ((v (Vibrato (DC 400) 1 0.02 0 0 0.04 0.1 0 0)))
  (Mul (SinOsc v 0) 0.1))
