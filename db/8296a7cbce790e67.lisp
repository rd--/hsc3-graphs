; line
(let ((f (line kr 200 17000 5 remove-synth)))
  (mul (sin-osc ar f 0) 0.1))
