; pv_magsmear
(let* ((s (Mul (LFSaw ar 500 0) (Decay2 (Mul (Impulse ar 2 0) 0.1) 0.01 2)))
       (x (MouseX kr 0 100 0 0.1))
       (c0 (fft* (LocalBuf 1 2048) s))
       (c1 (PV_MagSmear c0 x)))
  (ifft* c1))
