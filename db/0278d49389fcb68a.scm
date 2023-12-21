; Index
(let* ((b (asLocalBuf (Mce6 50 100 200 400 800 1600)))
       (f (Mul (Index b (Mul (LfSaw 2 3) 4)) (Mce2 1 9))))
  (Mul (SinOsc f 0) 0.05))
