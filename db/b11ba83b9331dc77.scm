; infeedback
(let ((f (MulAdd (InFeedback 1 0) 1300 300)))
 (Mul (SinOsc ar f 0) 0.1))
