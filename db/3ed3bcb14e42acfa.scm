; https://twitter.com/redFrik/status/839296011982024704 (f0)
(let* ((a (lambda (x) (LfSaw x 0)))
       (t (a (Mce2 0.5 0.6)))
       (f (Mul (MulAdd (a 5) (a 0.015) 1) 98))
       (m (Mul (Pow 2 (RoundTo (a 4) 0.5)) 99))
       (g (GrainFM 1 t 16 f m (Mul (Pow 2 (a (Mce2 1/8 1/9))) 8) 0 -1 512)))
  (Mul (Tanh (Div g 2)) 0.25))
