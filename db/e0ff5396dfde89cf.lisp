; synthetic piano (jmcc) #3
(mix-fill 6
  (lambda (_)
    (let* ((n (i-rand 36 90))
           (f (rand 0.1 0.5))
           (ph (rand 0 1))
           (s (mul (impulse ar f ph) 0.1))
           (e (decay2 s 0.008 0.04))
           (c
            (lambda (i)
              (let* ((n0 (lf-noise2 ar 3000))
                     (o (list-ref (list -0.05 0 0.04) i))
                     (dt (f-div 1 (midi-cps (add n o)))))
                (comb-l (mul n0 e) dt dt 6))))
           (l (sub (f-div (sub n 36) 27) 1)))
      (pan2 (mix-fill 3 c) l 1))))
