; pv_brickwall
(let ((x (MouseX -1 1 0 0.1))
      (c (FftDefaults (LocalBuf 1 2048) (Mul (WhiteNoise) 0.1))))
  (IfftDefaults (PV_BrickWall c x)))
