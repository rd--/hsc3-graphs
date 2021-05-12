; wrap
(let ((o (Mul (SinOsc ar 440 0) 0.1))
      (x (MouseX kr -0.1 -0.025 1 0.1))
      (y (MouseY kr 0.025 0.1 1 0.1)))
  (Wrap o x y))
