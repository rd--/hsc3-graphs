; Cos
(let* ((a (Ln (- pi) pi 1))
       (b (Sub (Div (Cos a) (/ pi 2)) 1))
       (f (MulAdd b 900 1600)))
  (Mul (SinOsc f 0) 0.1))
