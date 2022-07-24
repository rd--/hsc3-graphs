; TWindex ; modulating probability values
(let* ((t (Impulse 6 0))
       (a (Mce3 1/4 1/2 (MulAdd (SinOsc 0.3 0) 0.5 0.5)))
       (f (kr (Select (TWindex t 1.0 a) (Mce3 400 500 600)))))
  (Mul (SinOsc f 0) 0.2))
