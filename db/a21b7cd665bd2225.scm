; HenonN ; frequency control
(let ((x (MouseX 1 1.4 0 0.1))
      (y (MouseY 0 0.3 0 0.1))
      (f 40))
  (Mul (SinOsc (MulAdd (HenonN f x y 0 0) 800 900) 0) 0.05))
