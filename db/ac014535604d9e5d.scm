; alien froggies (jmcc) #1
(OverlapTexture
 (lambda (tr)
   (let* ((r 11)
          (r* (Fold (Mul r (Exp (TLinRandN 2 -0.2 0.2 0 tr))) 1 30))
          (o (Formant r* (TExpRandN 2 200 3000 tr) (MulAdd (TRandN 2 0 9 tr) r* r*))))
     (Mul o 0.05)))
 0.25 0.5 5)
