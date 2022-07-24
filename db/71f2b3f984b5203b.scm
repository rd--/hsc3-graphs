; LastValue
(let ((f (LastValue (MouseX 100 400 0 0.1) 40)))
 (Mul (SinOsc f 0) 0.1))
