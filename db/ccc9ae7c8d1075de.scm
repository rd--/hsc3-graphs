; DegreeToKey
(let* ((b (asLocalBuf 1 (list 0 2 3.2 5 7 9 10)))
       (x (MouseX kr 0 15 0 0.1))
       (k (DegreeToKey b x 12))
       (c (lambda (n r)
            (let* ((o (Mul (SinOsc ar (MIDICPS (Sum3 r k n)) 0) 0.1))
                   (t (LFPulse ar (MIDICPS (Mce2 48 55)) 0.15 0.5))
                   (f (MIDICPS (MulAdd (SinOsc kr 0.1 0) 10 r)))
                   (d (Mul (RLPF t f 0.1) 0.1))
                   (m (Add o d)))
              (Add (CombN m 0.31 0.31 2) m))))
       (n (Mul (LFNoise1 kr (Mce2 3 3.05)) 0.04)))
  (Mul (Add (c n 48) (c n 72)) 0.25))
