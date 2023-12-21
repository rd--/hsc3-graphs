; pv_magsmear
(let* ((s (Mul (LfSaw 500 0) (Decay2 (Mul (Impulse 2 0) 0.1) 0.01 2)))
       (x (MouseX 0 100 0 0.1))
       (c0 (FftDefaults (LocalBuf 1 2048) s))
       (c1 (PV_MagSmear c0 x)))
  (IfftDefaults c1))
