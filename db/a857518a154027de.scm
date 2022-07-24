; Linen ; MouseX is gate
(let* ((y (MouseY 0.01 0.1 0 0.1))
       (x (MouseX -1 1 0 0.1)))
  (Mul (SinOsc 440 0) (Linen x 1 y 1.0 doNothing)))
