; exp-rand
(let ((f (exp-rand 100 8000))
      (a (line kr 0.5 0 0.01 remove-synth)))
  (mul (f-sin-osc ar f 0) a))
