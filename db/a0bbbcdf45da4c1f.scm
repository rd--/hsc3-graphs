; alien froggies (jmcc) #1
(u:overlap-texture
 0.25 0.5 5
 (lambda (tr)
   (let* ((r 11)
          (r* (Fold (Mul r (Exp (TRand -0.2 0.2 tr))) 1 30)) ; t-lin-rand
          (o (Formant ar r* (TExpRand 200 3000 tr) (MulAdd (TRand 0 9 tr) r* r*))))
     (Mul o 0.05))))
