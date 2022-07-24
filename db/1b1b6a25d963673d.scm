; LastValue
(let* ((x (MouseX 0.1 4 0 0.1))
       (f (MulAdd (Abs (Sub x (LastValue x 0.5))) 400 200)))
  (Mul (SinOsc f 0) 0.1))
