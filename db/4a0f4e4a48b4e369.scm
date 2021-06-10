; mouse clatter (rd)
(let* ((x (MouseX kr 100 12000 0 0.1))
       (y (MouseY kr 0.01 0.15 0 0.1))
       (n1 (LFNoise0 kr (Mce2 3 3.25)))
       (t (Impulse kr (MulAdd n1 16 18) 0))
       (n2 (TRand 0.005 y t))
       (n3 (WhiteNoise ar))
       (n4 (TRand 10 x t))
       (n5 (TRand 0.0 1.0 t))
       (n6 (TExpRand 0.15 1.0 t))
       (e (Decay2 t 0.01 n2))
       (o (BPF (Mul n3 e) n4 n5))
       (n7 (PV_RandComb (FFT (LocalBuf 1 2048) o 0.5 0 1 0) n6 t)))
  (Add (Mul o 0.05) (IFFT n7 0 0)))
