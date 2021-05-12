; oscillator cluster (rd)
(let*
  ((ln
    (lambda (a b d)
      (Line kr a b d remove-synth)))
   (xln
    (lambda (a b d)
      (XLine kr a b d remove-synth)))
   (rln
    (lambda (r a b d)
      (Line kr (Add a (Rand 0 r)) b d remove-synth)))
   (rxln
    (lambda (r a b d)
      (XLine kr (Add a (Rand 0 r)) b d remove-synth)))
   (prt
    (lambda (d a)
      (lambda (cf)
        (let* ((r1 (Rand cf (Add cf 2)))
               (r2 (rln 1 5 0.01 d))
               (r3 (rln 10 20 0 d))
               (r4 (Rand 0.1 0.2))
               (f (Add (mce2 cf r1) (Mul (SinOsc kr r2 0) r3)))
               (o (FSinOsc ar f 0))
               (e (Mul (Decay2 (Impulse ar 0 0) r4 d) a)))
          (Mul o e)))))
   (np 12)
   (fp (RRandN np 220 660))
   (d (Rand 4 7))
   (a (Rand 0.01 0.05)))
  (mix (mce-map (prt d a) fp)))
