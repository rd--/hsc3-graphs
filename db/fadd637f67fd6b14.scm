; http://sccode.org/1-4Qy (f0)
(let* ((a (lambda (f p) (SinOsc f p)))
       (f (Add (a (Mce2 1/5 1/6) 0) (Mce2 798 912)))
       (p (Mul (MulAdd (a 1/16 0) 19 99) (a (Mce2 9 8) 0)))
       (m (a (Mul (a 6 0) (a 0.009 0)) 0))
       (b (Mul (a f p) m)))
  (Mul (Tanh (a (Mce2 201 301) b)) 0.1))
