; implosion (rd)
(let* ((mkls (lambda (bp t) (EnvGen kr 1 1 0 1 removeSynth (envBreakPointLinear bp t 1))))
       (mkrmp (lambda (l r t) (mkls (list 0 l 1 r) t)))
       (wrp (lambda (i l r) (let ((m (FDiv (Sub r l) 2))) (MulAdd i m (Add l m)))))
       (pmr/n
        (lambda (rt l0 l1 r0 r1 d)
          (let ((le (mkrmp l0 r0 d))
                (re (mkrmp l1 r1 d)))
            (wrp (WhiteNoise rt) le re))))
       (d (Rand 7.5 13.5))
       (f0 (Rand 10990 16220))
       (f1 (Rand  9440 19550))
       (f (pmr/n ar 440 f0 f1 f1 d))
       (l (pmr/n kr (Rand -1 0) (Rand 0 1) 0 0 d))
       (a (pmr/n kr 0.1 0.6 0 0 d)))
  (Pan2 (Saw ar f) l a))
