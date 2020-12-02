; impulse
(let ((f (x-line kr 800 10 5 remove-synth)))
  (mul (impulse ar f 0.0) 0.1))
