; i-rand
(let ((f (i-rand 60 72))
      (a (line kr 0.1 0 0.1 remove-synth)))
  (mul (f-sin-osc ar (midi-cps f) 0) a))
