; n-rand
(let ((f (mul (n-rand 1200 4000 2) (mce2 2 5)))
      (a (line kr 0.1 0 0.01 remove-synth)))
  (mul (f-sin-osc ar f 0) a))
