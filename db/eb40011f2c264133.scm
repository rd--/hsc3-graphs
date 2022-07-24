; xout
(let ((oscPair (lambda (a b) (Mul (SinOsc (Mce2 a b) 0) 0.1))))
  (Mrg4 (oscPair 220 221)
        (XOut 0 (MouseX 0 1 0 0.1) (oscPair 330 331))
        (XOut 0 (MouseY 0 1 0 0.1) (oscPair 440 441))
        (Out 0 (oscPair 120 121))))
