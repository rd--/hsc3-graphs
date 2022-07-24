; mixFill
(let ((f (lambda (k) (Mul (SinOsc (MulAdd 110 k 110) 0) (DbAmp (Sub 0 (Mul k 3)))))))
  (Mul (mixFill 8 f) 0.05))
