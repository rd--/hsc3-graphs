; db-amp
(let* ((x (MouseX kr -60 0 0 0.1))
       (f (MulAdd (DbAmp x) 200 700)))
  (Mul (SinOsc ar f 0) 0.1))
