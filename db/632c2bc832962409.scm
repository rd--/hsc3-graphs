; Index
(let* ((b (asLocalBuf (list 50 100 200 400 800 1600)))
       (f (Mul (Index b (Mul (LFSaw 2 3) 4)) (List 1 9))))
  (Mul (SinOsc f 0) 0.05))
