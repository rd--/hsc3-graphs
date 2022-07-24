; SOS ; same as two-pole
(let* ((theta (Line (* 0.2 pi) pi 5 removeSynth))
       (rho (Line 0.6 0.99 5 doNothing))
       (b1 (Mul 2 (Mul rho (Cos theta))))
       (b2 (Neg (Squared rho))))
  (SOS (Mul (LFSaw 200 0) 0.05) 1 0 0 b1 b2))
