; bouncing-objects (jmcc #2)
(overlapTextureGraph
 0.001 3 (/ 3.001 0.6)
  (lambda (tr)
    (let* ((i (Mul (Impulse (TXLine (Add 5 (TRand2 2 tr)) 600 4 tr) 0) (TXLine 0.09 0.000009 4 tr)))
           (flt (DynKlank (Decay i 0.001) 1 0 1 (klankDataMce (TRandN 4 400 8400 tr) (TRandN 4 0 1 tr) (TRandN 4 0.01 0.11 tr))))
           (e (Env '(1 1 0) '(3 0.001) (replicate 2 'linear) -1 -1))
           (o (Mul (Pan2 flt (TRand2 1 tr) 1) (EnvGen tr 1 0 1 doNothing e))))
      (DelayN o 1 (TRand 0 1 tr)))))
