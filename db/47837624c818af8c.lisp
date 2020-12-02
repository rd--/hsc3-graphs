; lin-rand
(let ((f (lin-rand 200 10000 (mce2 -1 1)))
      (a (line kr 0.1 0 0.01 remove-synth)))
  (mul (f-sin-osc ar f 0) a))
