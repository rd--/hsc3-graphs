; alien meadow (jmcc) #6
(OverlapTexture
 (lambda (tr)
   (let ((f (Add (Mul3 (SinOsc (TRand 0 20 tr) 0) (TRand 0 5000 tr) 0.1) (TRand 0 5000 tr))))
     (Pan2 (SinOsc f 0) (TRand -1 1 tr) (MulAdd (SinOsc (TRand 0 20 tr) 0) 0.05 0.05))))
 2 6 6)
