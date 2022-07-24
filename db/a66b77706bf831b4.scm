; PV_MagBelow ; c.f. pv-mag-above
(let* ((f1 (Squared (MulAdd (SinOsc 0.08 0) 6 6.2)))
       (f2 (MulAdd (SinOsc f1 0) 100 800))
       (s (SinOsc f2 0))
       (x (MouseX 1 1024 0 0.1))
       (y (MouseY 0 1 0 0.1))
       (c1 (fftDefaults (LocalBuf 1 2048) s))
       (c2 (PV_Copy c1 (LocalBuf 1 2048)))
       (c3 (PV_MagBelow c1 x))
       (c4 (PV_MagAbove c2 x)))
  (Mul3 (Mce2 (ifftDefaults c3) (ifftDefaults c4)) (Mce2 y (Sub 1 y)) 0.1))
