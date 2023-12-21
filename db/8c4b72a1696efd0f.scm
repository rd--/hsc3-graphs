; 20060918 (rd)
(let* ((wrp (lambda (i l r) (LinLin i -1 1 l r)))
       (t (Dust 0.75))
       (l (Latch t t))
       (p (Mul (Pulse (wrp (BrownNoiseN 2) 2 (Mce2 11 15)) 0.01) 0.05))
       (f (wrp (BrownNoiseN 2) 300 1800))
       (rq (wrp (BrownNoiseN 2) 0.25 2)))
  (Mrg2
   (Add
    (Mul (Formant (Mce2 20 21) (wrp (LfNoise2 2) 10 100) 200) 0.15)
    (Mul l (Rlpf p f rq)))
   (SendTrig t 0 t)))
