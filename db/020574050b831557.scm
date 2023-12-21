; MulAdd ; ternary operator
(let ((f (MulAdd (LfSaw (Mce2 10 9) 0) 200 400)))
  (Mul (SinOsc f 0) 0.1))
