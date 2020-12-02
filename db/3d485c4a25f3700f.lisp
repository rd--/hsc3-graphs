; compander ; compressor
(let ((z (mul (decay2 (mul (impulse ar 8 0) (mul (lf-saw kr 0.3 0) 0.3)) 0.001 0.3) (mix (pulse ar (mce2 80 81) 0.3))))
      (x (mouse-x kr 0.01 1 0 0.1)))
  (mce2 z (compander z z x 1 0.5 0.01 0.01)))
