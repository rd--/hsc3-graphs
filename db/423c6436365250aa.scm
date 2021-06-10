; Linen ; MouseX is gate
(let* ((y (MouseY kr 0.01 0.1 0 0.1))
       (x (MouseX kr -1 1 0 0.1)))
  (Mul (SinOsc ar 440 0) (Linen x 1 y 1.0 doNothing)))
