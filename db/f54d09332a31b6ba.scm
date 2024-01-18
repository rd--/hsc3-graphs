; Sinh
(let* ((a (Line (- pi) pi 1 removeSynth))
       (b (Sub (Div (Sinh a) (/ pi 2)) 1))
       (f (MulAdd b 900 1600)))
  (Mul (SinOsc f 0) 0.05))
