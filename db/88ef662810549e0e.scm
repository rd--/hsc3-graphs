; pulse-divider
(let* ((p (Impulse ar 8 0))
       (d (PulseDivider p (Mce2 4 7) 0))
       (a (Mul (SinOsc ar 1200 0) (Decay2 p 0.005 0.1)))
       (b (Mul (SinOsc ar 600 0) (Decay2 d 0.005 0.5))))
 (Mul (Add a b) 0.1))
