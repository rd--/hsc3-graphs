; TWindex ; assuming normalized values
(let* ((prob (mce3 1/5 2/5 2/5))
       (freq (mce3 400 500 600))
       (f (Select (TWindex (Impulse kr 6 0) 0.0 prob) freq)))
  (Mul (SinOsc ar f 0) 0.2))
