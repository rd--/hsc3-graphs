; sin-osc ; modulate freq
(let ((f (x-line kr 2000 200 1 remove-synth)))
  (mul (sin-osc ar f 0) 0.1))
