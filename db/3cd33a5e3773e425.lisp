; rotate2 ; rotation of stereo sound, via lfo
(let ((x (mul (pink-noise ar) 0.1))
      (y (mul (lf-tri ar 800 0) (mul (lf-pulse kr 3 0 0.3) 0.05))))
  (rotate2 x y (lf-saw kr 0.1 0)))
