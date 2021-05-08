; HenonN ; frequency control
(let ((x (MouseX kr 1 1.4 0 0.1))
      (y (MouseY kr 0 0.3 0 0.1))
      (f 40))
  (Mul (SinOsc ar (MulAdd (HenonN ar f x y 0 0) 800 900) 0) 0.05))
