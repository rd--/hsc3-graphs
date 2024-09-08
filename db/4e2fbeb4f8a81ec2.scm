; Wrap
(let ((o (Mul (SinOsc 440 0) 0.1))
      (x (MouseX -0.1 -0.025 1 0.1))
      (y (MouseY 0.025 0.1 1 0.1)))
  (Wrap o x y))
