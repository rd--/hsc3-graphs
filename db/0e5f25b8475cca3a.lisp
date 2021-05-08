; sign
(let* ((a (Line ar -1 1 1 remove-synth))
       (b (Sign a))
       (f (MulAdd (mce2 a b) 600 900)))
  (Mul (SinOsc ar f 0) 0.1))
