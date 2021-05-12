; log2
(let* ((a (Line ar -2 2 3 remove-synth))
       (b (Log2 a))
       (f (MulAdd (mce2 a b) 600 900)))
  (Mul (SinOsc ar f 0) 0.1))
