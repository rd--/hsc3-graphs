; rotate2 ; rotation of stereo sound, via mouse
(let ((x (mixFill 4 (lambda (_) (Mul (LFSaw ar (Rand 198 202) 0) 0.025))))
      (y (Mul (SinOsc ar 900 0) (Mul (LFPulse kr 3 0 0.3) 0.05))))
  (Rotate2 x y (MouseX kr 0 2 0 0.1)))
