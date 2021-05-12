; Compander ; compressor
(let ((z (Mul (Decay2 (Mul (Impulse ar 8 0) (Mul (LFSaw kr 0.3 0) 0.3)) 0.001 0.3) (mix (Pulse ar (mce2 80 81) 0.3))))
      (x (MouseX kr 0.01 1 0 0.1)))
  (mce2 z (Compander z z x 1 0.5 0.01 0.01)))
