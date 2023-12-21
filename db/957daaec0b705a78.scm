; Rotate2 ; rotation of stereo sound, via lfo
(let ((x (Mul (PinkNoise) 0.1))
      (y (Mul (LfTri 800 0) (Mul (LfPulse 3 0 0.3) 0.05))))
  (Rotate2 x y (LfSaw 0.1 0)))
