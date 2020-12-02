; sin-osc ; modulate phase
(let* ((f (x-line kr 20 8000 10 remove-synth))
       (p (mul (sin-osc ar f 0) (* pi 2))))
  (mul (sin-osc ar 800 p) 0.1))
