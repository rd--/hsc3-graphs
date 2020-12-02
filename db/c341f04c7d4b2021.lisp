; i-rand
(let ((f (i-rand 200 1200))
      (a (line kr 0.1 0 0.1 remove-synth)))
  (mul (f-sin-osc ar f 0) a))
