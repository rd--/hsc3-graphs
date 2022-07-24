; TWindex ; assuming normalized values
(let* ((prob (Mce3 1/5 2/5 2/5))
       (freq (Mce3 400 500 600))
       (f (kr (Select (TWindex (Impulse 6 0) 0.0 prob) freq))))
  (Mul (SinOsc f 0) 0.2))
