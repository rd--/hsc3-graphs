; pv_mul
(let* ((a (Mul (SinOsc ar 500 0) 0.5))
       (b (Mul (SinOsc ar (Line kr 100 400 5 do-nothing) 0) 0.5))
       (ca (fft* (LocalBuf 1 2048) a))
       (cb (fft* (LocalBuf 1 2048) b))
       (cc (PV_Mul ca cb)))
  (Mul 0.1 (ifft* cc)))
