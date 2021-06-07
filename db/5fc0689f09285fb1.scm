; coolant (jmcc) #2 ; texture=overlap,4,4,2,inf
(let* ((p 10)
       (n (make-mce (replicate p 1)))
       (sp (mce2 (klank-data-mce (RRandN p 40 2400) n n)
                 (klank-data-mce (RRandN p 40 2400) n n)))
       (s (OnePole (Mul (mce-fill 2 (lambda (_) (BrownNoise ar))) 0.002) 0.95)))
  (Klank s 1 0 1 (mce-transpose sp)))
