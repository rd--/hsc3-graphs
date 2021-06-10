; sign
(let* ((a (Line ar -1 1 1 removeSynth))
       (b (Sign a))
       (f (MulAdd (Mce2 a b) 600 900)))
  (Mul (SinOsc ar f 0) 0.1))
