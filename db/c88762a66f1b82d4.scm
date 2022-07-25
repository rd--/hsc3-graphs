; chain saw (jrhb)
(let* ((coin* ; SimpleNumber.coin (not Ugen/Coin)
        (lambda (n a b)
          (if (> (s:rand 0.0 1.0) n) a b)))
       (chain
        (lambda (n fn)
          (foldl1 compose (replicate n fn))))
       (clipu
        (lambda (s) (Clip2 s 1)))
       (dup
        (lambda (a) (Mce2 a a)))
       (mk-f
        (lambda (s1)
          (let* ((xr (mceFill 2 (lambda (_) (ExpRand 0.1 2))))
                 (n1 (LFNoise1 xr))
                 (n2 (LFNoise1 xr))
                 (n3 (LFNoise1 xr))
                 (f1 (coin* 0.6 (ExpRange n1 0.01 10) (ExpRange n2 10 50)))
                 (s2 (coin* 0.5 (Sub 1 s1) (mceReverse s1)))
                 (f2 (LinExp s1 -1 1 f1 (Mul f1 (ExpRange n3 2 10))))
                 (u1 (LFSaw f2 0))
                 (u2 (MulAdd (LFSaw (Mul f1 0.1) 0) 0.1 1)))
            (clipu (coin* 0.5 (Mul u1 s2) (Mul u1 u2))))))
       (inp (LFSaw (Mul 0.2 (Mce2 1 1.1)) 0))
       (b-frEq (Mce4 70 800 9000 5242))
       (ff ((chain 8 mk-f) inp))
       (c-Saw (mceProduct (Saw (ExpRange ff 6 11000))))
       (b-Saw (dup (Mix (BPF c-Saw b-frEq 0.2)))))
  (Mul b-Saw 0.3))