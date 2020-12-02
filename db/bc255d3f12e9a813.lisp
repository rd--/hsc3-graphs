; oscillator cluster (rd)
(let*
  ((ln
    (lambda (a b d)
      (line kr a b d remove-synth)))
   (xln
    (lambda (a b d)
      (x-line kr a b d remove-synth)))
   (rln
    (lambda (r a b d)
      (line kr (add a (rand 0 r)) b d remove-synth)))
   (rxln
    (lambda (r a b d)
      (x-line kr (add a (rand 0 r)) b d remove-synth)))
   (prt
    (lambda (d a)
      (lambda (cf)
        (let* ((r1 (rand cf (add cf 2)))
               (r2 (rln 1 5 0.01 d))
               (r3 (rln 10 20 0 d))
               (r4 (rand 0.1 0.2))
               (f (add (mce2 cf r1) (mul (sin-osc kr r2 0) r3)))
               (o (f-sin-osc ar f 0))
               (e (mul (decay2 (impulse ar 0 0) r4 d) a)))
          (mul o e)))))
   (np 12)
   (fp (rand-n np 220 660))
   (d (rand 4 7))
   (a (rand 0.01 0.05)))
  (mix (mce-map (prt d a) fp)))
