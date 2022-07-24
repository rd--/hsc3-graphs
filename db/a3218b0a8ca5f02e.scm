; InFeedback
(let ((f (MulAdd (InFeedback 1 0) 1300 300)))
 (Mul (SinOsc f 0) 0.1))
