; pv_randwipe
(let* ((n 6)
       (a (mixFill n (lambda (_) (Mul (LFSaw ar (ExpRand 400.0 1000.0) 0.0) 0.1))))
       (b (mixFill n (lambda (_) (Mul (LFPulse ar (ExpRand 80.0 400.0) 0.0 0.2)
                                      (Max (Mul (SinOsc kr (Rand 0.0 8.0) 0.0) 0.2) 0.0)))))
       (f (fftDefaults (LocalBuf 1 2048) a))
       (g (fftDefaults (LocalBuf 1 2048) b))
       (y (MouseY kr 0 1 0 0.1))
       (x (MouseX kr 0 1 0 0.1))
       (h (PV_RandWipe f g x (GT y 0.5)))
       (i (ifftDefaults h)))
  (Mul 0.5 (Mce2 i i)))
