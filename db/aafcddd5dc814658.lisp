; pan2
(let ((x (MouseX kr -1 1 0 0.1))
      (y (MouseY kr 0 0.1 0 0.1)))
  (Pan2 (PinkNoise ar) x y))
