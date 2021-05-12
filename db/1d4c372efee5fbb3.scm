; lastvalue
(let ((f (LastValue (MouseX kr 100 400 0 0.1) 40)))
 (Mul (SinOsc ar f 0) 0.1))
