; lots-o-sins (jmcc) #2 ; texture=xfade,4,4,inf
(let* ((n 60)
       (f0 (RRandN n 40 10000))
       (f1 (RRandN n 40 10000))
       (mk_k (lambda (x) (asMce (replicate n x))))
       (o1 (Klang ar 1 0 (klangDataMce f0 (mk_k 1) (mk_k 0))))
       (o2 (Klang ar 1 0 (klangDataMce f1 (mk_k 1) (mk_k 0)))))
  (Mul (Mce2 o1 o2) (/ 0.1 n)))
