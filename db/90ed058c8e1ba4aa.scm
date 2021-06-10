; cut-outs (rd)
(let* ((t (Mul (Impulse ar 22 0) (Add (SinOsc kr 0.5 0) 1)))
       (x (MouseX kr 0.005 0.12 1 0.1))
       (y (MouseY kr 0.01 0.52 1 0.1))
       (n (lambda (_)
            (let* ((n1 (LFNoise0 kr 2))
                   (n2 (CoinGate (Sum3 0.05 (Mul n1 0.4) y) (Mul t 0.5)))
                   (n3 (TExpRand (Mce2 500 900) 1600 t)))
              (Ringz n2 n3 x))))
       (s (mixFill 3 n))
       (b (TRand 0 1 (Dust kr 8))))
  (make-mrg (Mul (Clip2 s (In 1 kr 0)) 0.25)
            (Out 0 b)))
