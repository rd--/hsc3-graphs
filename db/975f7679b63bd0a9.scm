; tank (jmcc)
(let* ((bang
        (let ((d (Dust 0.01))
              (n (BrownNoise)))
          (Pan2 (Mul (Decay2 d 0.04 0.3) n) 0 1)))
       (pling
        (lambda (_)
          (let ((o (FSinOsc (ExpRand 300 2200) 0))
                (d (Decay2 (Dust 0.5) 0.1 0.5)))
            (Pan2 (Mul (Mul d 0.1) (Cubed o)) (Rand -1 1) 1))))
       (rallpass
        (lambda (i)
          (AllpassN i 0.03 (RandN 2 0.005 0.02) 1)))
       (rallpasses
        (foldl1 compose (replicate 4 rallpass)))
       (tank
        (lambda (i)
          (let* ((l0 (Mul (LocalIn 2 (Mce2 0 0)) 0.98))
                 (l1 (OnePole l0 0.33))
                 (l2 (Rotate2 (mceChannel l1 0) (mceChannel l1 1) 0.23))
                 (l3 (AllpassN l2 0.05 (RandN 2 0.01 0.05) 2))
                 (l4 (DelayN l3 0.3 (Mce2 0.17 0.23)))
                 (l5 (AllpassN l4 0.05 (RandN 2 0.03 0.15) 2))
                 (l6 (LeakDC l5 0.995))
                 (l7 (Add l6 i)))
            (Mrg2 l7 (LocalOut l7))))))
  (tank (rallpasses (Add bang (mixFill 8 pling)))))
