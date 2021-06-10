; TanH
(let* ((a (Line kr (Neg pi) pi 5 removeSynth))
       (b (Sub (FDiv (TanH a) (/ pi 2)) 1))
       (f (MulAdd b 900 1600)))
  (Mul (SinOsc ar f 0) 0.05))
