; pv_brickwall
(let ((x (MouseX kr -1 1 0 0.1))
      (c (fftDefaults (LocalBuf 1 2048) (Mul (WhiteNoise ar) 0.1))))
  (ifftDefaults (PV_BrickWall c x)))
