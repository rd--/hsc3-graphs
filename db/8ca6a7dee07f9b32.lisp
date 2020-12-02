; f-sin-osc ; loses amplitude towards the end
(let ((f (mul-add (f-sin-osc ar (x-line kr 4 401 8 remove-synth) 0) 200 800)))
  (mul (f-sin-osc ar f 0) 0.15))
