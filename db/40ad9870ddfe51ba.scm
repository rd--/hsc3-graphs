; alien meadow (jmcc) #6
(overlapTextureGraph
 2 6 6
 (lambda (tr)
   (let* ((a (TRand 0 20 tr))
          (b (TRand 0 5000 tr))
          (c (TRand 0 20 tr))
          (p (TRand -1 1 tr))
          (f (Add (Mul3 (SinOsc ar a 0) b 0.1) b)))
     (Pan2 (SinOsc ar f 0) p (MulAdd (SinOsc ar c 0) 0.05 0.05)))))
