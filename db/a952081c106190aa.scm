; Dswitch ; c.f. dswitch1
(let* ((a0 (Dwhite 2 3 4))
       (a1 (Dwhite 2 0 1))
       (a2 (Dseq 2 (asMce (list 1 1 1 0))))
       (i (Dseq 2 (asMce (list 0 1 2 1 0))))
       (d (Dswitch i (asMce (list a0 a1 a2))))
       (t (Impulse 4 0))
       (f (MulAdd (Demand t 0 d) 300 400)))
  (Mul (SinOsc f 0) 0.1))
