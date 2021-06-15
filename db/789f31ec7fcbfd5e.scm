; resonant dust (jmcc) #2
(overlapTextureGraph
 5 2 9
 (lambda (tr)
   (let* ((st (TRand 80 2080 tr))
          (en (MulAdd (TRand2 0.5 tr) st st))
          (rf (TXLine st en 9 tr))
          (d (Mul (Dust ar (TRand 50 850 tr)) 0.3)))
     (Pan2 (Resonz d rf 0.1) (TRand2 1 tr) 1))))
