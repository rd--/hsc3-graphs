; SOS ; same as two-pole
(let* ((theta (Line kr (* 0.2 pi) pi 5 remove-synth))
       (rho (Line kr 0.6 0.99 5 do-nothing))
       (b1 (Mul 2 (Mul rho (Cos theta))))
       (b2 (Neg (Squared rho))))
  (SOS (Mul (LFSaw ar 200 0) 0.05) 1 0 0 b1 b2))
