; index
(let* ((b (asLocalBuf 1 (list 50 100 200 400 800 1600)))
       (f (Mul (Index b (Mul (LFSaw kr 2 3) 4)) (Mce2 1 9))))
  (Mul (SinOsc ar f 0) 0.05))
