; DbAmp
(let* ((x (MouseX -60 0 0 0.1))
       (f (MulAdd (DbAmp x) 200 700)))
  (Mul (SinOsc f 0) 0.1))
