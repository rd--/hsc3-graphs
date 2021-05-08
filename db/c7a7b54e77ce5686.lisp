; pv_brickwall
(let ((x (MouseX kr -1 1 0 0.1))
      (c (fft* (LocalBuf 1 2048) (Mul (WhiteNoise ar) 0.1))))
  (ifft* (PV_BrickWall c x)))
