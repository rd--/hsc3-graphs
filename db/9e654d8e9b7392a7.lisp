; ArcCos
(let* ((a (Line kr -1 1 1 remove-synth))
       (b (Sub (FDiv (ArcCos a) (/ pi 2)) 1))
       (f (MulAdd b 900 1600)))
  (Mul (SinOsc ar f 0) 0.1))
