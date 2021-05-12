; chain saw (jrhb)
(let* ((coin* ; SimpleNumber.coin (not UGen/Coin)
        (lambda (n a b)
          (if (> (s:rand 0.0 1.0) n) a b)))
       (exp-range
        (lambda (s l r)
          (LinExp s -1 1 l r)))
       (chain
        (lambda (n fn)
          (foldl1 compose (replicate n fn))))
       (mce-product
        (mce-edit (lambda (l) (list (foldl1 Mul l)))))
       (clipu
        (lambda (s) (Clip2 s 1)))
       (dup
        (lambda (a) (mce2 a a)))
       (mk-f
        (lambda (s1)
          (let* ((xr (clone 2 (lambda () (ExpRand 0.1 2))))
                 (n1 (LFNoise1 kr xr))
                 (n2 (LFNoise1 kr xr))
                 (n3 (LFNoise1 kr xr))
                 (f1 (coin* 0.6 (exp-range n1 0.01 10) (exp-range n2 10 50)))
                 (s2 (coin* 0.5 (Sub 1 s1) (mce-reverse s1)))
                 (f2 (LinExp s1 -1 1 f1 (Mul f1 (exp-range n3 2 10))))
                 (u1 (LFSaw kr f2 0))
                 (u2 (MulAdd (LFSaw kr (Mul f1 0.1) 0) 0.1 1)))
            (clipu (coin* 0.5 (Mul u1 s2) (Mul u1 u2))))))
       (inp (LFSaw kr (Mul 0.2 (mce2 1 1.1)) 0))
       (b-frEQ (make-mce (list 70 800 9000 5242)))
       (ff ((chain 8 mk-f) inp))
       (c-Saw (mce-product (Saw ar (exp-range ff 6 11000))))
       (b-Saw (dup (mix (BPF c-Saw b-frEQ 0.2)))))
  (Mul b-Saw 0.3))
