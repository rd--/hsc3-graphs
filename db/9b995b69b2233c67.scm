; birdies (jmcc)
(overlapTextureGraph
 7 4 4
 (lambda (tr)
   (let* ((p1 (Add (Mul (LFPulse kr (TRand 0.4 1.4 tr) 0 (TRand 0.1 0.9 tr)) (TRand 4 7 tr)) 2))
          (p2 (Mul (LFPulse kr (TRand 0.4 1.4 tr) 0 (TRand 0.1 0.9 tr)) (TRand 4 7 tr)))
          (p3 (Mul (LFPulse kr (TRand 0.2 0.7 tr) 0 0.4) 0.02))
          (sw (Add (Mul (LFSaw kr (Add p1 p2) 0) (Neg (TRand 1000 1800 tr))) (Add 4000 (TRand -1200 1200 tr))))
          (frEQ (Lag sw 0.05))
          (amp (Lag p3 0.3)))
     (Pan2 (Mul (SinOsc ar frEQ 0) amp) (TRand -1 1 tr) 1))))
