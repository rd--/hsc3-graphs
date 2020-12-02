; x-out
(let ((osc-pair (lambda (a b) (mul (sin-osc ar (mce2 a b) 0) 0.1))))
  (mrg4 (osc-pair 220 221)
        (x-out 0 (mouse-x kr 0 1 0 0.1) (osc-pair 330 331))
        (x-out 0 (mouse-y kr 0 1 0 0.1) (osc-pair 440 441))
        (out 0 (osc-pair 120 121))))
