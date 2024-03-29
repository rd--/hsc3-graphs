; 20060928 (rd)
(let*
    ((f (lambda (t g j n f)
          (let ((pd (PulseDivider t j 0)))
            (Mul (Formlet pd
                          (Mul f (TiRand (Mce2 2 1) n pd))
                          (TRand 0.01 0.04 pd)
                          (TRand 0.05 0.10 pd))
		 g))))
     (n (lambda (t)
          (list (f t 0.15 2 9 (Mce2 200 400))
		(f t 0.25 2 9 (Mce2 (Add 200 (TRand 0 1 t))
                                    (Add 400 (TRand 0 1 t))))
		(f t 0.05 4 5 (Mce2 25 50))
		(f t 0.15 4 5 (Mce2 (Add 25 (TRand 0 1 t))
                                    (Add 50 (TRand 0 1 t))))
		(Mul (f t 0.5 1 16 (Mce2 300 600))
                     (Latch (CoinGate 0.2 t) t))))))
  (Mul (MulAdd (LfNoise0 2) 0.25 0.25)
       (Mix (n (Impulse (LinLin (LfNoise2 9) -1 1 12 64) 0)))))
