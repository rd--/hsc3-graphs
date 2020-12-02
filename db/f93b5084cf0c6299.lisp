; rotate2 ; rotation of stereo sound, via mouse
(let ((x (mix-fill 4 (lambda (_) (mul (lf-saw ar (rand 198 202) 0) 0.025))))
      (y (mul (sin-osc ar 900 0) (mul (lf-pulse kr 3 0 0.3) 0.05))))
  (rotate2 x y (mouse-x kr 0 2 0 0.1)))
