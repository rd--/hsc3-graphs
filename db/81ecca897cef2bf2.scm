; rotate2 ; rotation of stereo sound, via lfo
(let ((x (Mul (PinkNoise ar) 0.1))
      (y (Mul (LFTri ar 800 0) (Mul (LFPulse kr 3 0 0.3) 0.05))))
  (Rotate2 x y (LFSaw kr 0.1 0)))
