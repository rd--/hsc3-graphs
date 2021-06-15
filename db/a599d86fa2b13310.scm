; alien meadow (jmcc) #6
(overlapTextureGraph
 2 6 6
 (lambda (tr)
   (let ((f (Add (Mul3 (SinOsc ar (TRand 0 20 tr) 0) (TRand 0 5000 tr) 0.1) (TRand 0 5000 tr))))
     (Pan2 (SinOsc ar f 0) (TRand -1 1 tr) (MulAdd (SinOsc ar (TRand 0 20 tr) 0) 0.05 0.05)))))
