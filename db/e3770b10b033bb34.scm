; pv_mul
(let* ((a (Mul (SinOsc 500 0) 0.5))
       (b (Mul (SinOsc (Line 100 400 5 doNothing) 0) 0.5))
       (ca (fftDefaults (LocalBuf 1 2048) a))
       (cb (fftDefaults (LocalBuf 1 2048) b))
       (cc (PV_Mul ca cb)))
  (Mul 0.1 (ifftDefaults cc)))
