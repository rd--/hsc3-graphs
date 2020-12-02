; sin-osc ; modulate freq
(let* ((f1 (x-line kr 1 1000 9 remove-synth))
       (f2 (mul-add (sin-osc ar f1 0) 200 800)))
  (mul (sin-osc ar f2 0) 0.1))
