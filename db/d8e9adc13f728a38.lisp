; xout
(let ((osc-pair (lambda (a b) (Mul (SinOsc ar (mce2 a b) 0) 0.1))))
  (mrg4 (osc-pair 220 221)
        (XOut 0 (MouseX kr 0 1 0 0.1) (osc-pair 330 331))
        (XOut 0 (MouseY kr 0 1 0 0.1) (osc-pair 440 441))
        (Out 0 (osc-pair 120 121))))
