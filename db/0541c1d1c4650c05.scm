; Compander ; compressor
(let ((z (Mul (Decay2 (Mul (Impulse 8 0) (Mul (LfSaw 0.3 0) 0.3)) 0.001 0.3) (Mix (Pulse (Mce2 80 81) 0.3))))
      (x (MouseX 0.01 1 0 0.1)))
  (Mce2 z (Compander z z x 1 0.5 0.01 0.01)))
