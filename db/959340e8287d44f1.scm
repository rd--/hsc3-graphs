; mix-fill
(let ((f (lambda (k) (Mul (SinOsc ar (MulAdd 110 k 110) 0) (DbAmp (Sub 0 (Mul k 3)))))))
  (Mul (mix-fill 8 f) 0.05))
