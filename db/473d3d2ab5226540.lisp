; f-sin-osc
(let ((f (x-line kr 200 4000 1 remove-synth)))
  (mul (f-sin-osc ar f 0) 0.25))
