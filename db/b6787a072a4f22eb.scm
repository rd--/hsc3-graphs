; coolant (jmcc) #2 ; texture=overlap,4,4,2,inf
(let* ((p 10)
       (n (replicate p 1))
       (sp (List
            (klankDataMce (RandN p 40 2400) n n)
            (klankDataMce (RandN p 40 2400) n n)))
       (s (OnePole (Mul (dup (lambda () (BrownNoise)) 2) 0.002) 0.95)))
  (Klank s 1 0 1 (Transpose sp)))
