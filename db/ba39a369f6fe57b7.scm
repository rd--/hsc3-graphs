; cricket (rd)
(let* ((mt-rand
        (lambda (l r t)
          (mce2 (TRand l r t) (TRand l r t))))
       (r1 (RRandN 2 10 13))
       (r2 (RRandN 2 10 13))
       (r3 (RRandN 2 4 7))
       (t (Impulse kr 0.7 0))
       (e (Decay2 (Impulse kr r1 0) 0.001 0.005))
       (f (mul3 (SinOsc kr r2 0) e r3))
       (r4 (RTRandN 2 2220 2227 t)))
  (mul3 (SinOsc ar r4 0) f 0.25))
