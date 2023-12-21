; Rotate2 ; rotation of stereo sound, via mouse
(let ((x (! (lambda () (Mul (LfSaw (Rand 198 202) 0) 0.025)) 4))
      (y (Mul (SinOsc 900 0) (Mul (LfPulse 3 0 0.3) 0.05))))
  (Rotate2 x y (MouseX 0 2 0 0.1)))
