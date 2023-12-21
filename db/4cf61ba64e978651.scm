; 20060915 (rd)
(let*
  ((ln
    (lambda (a b d)
      (Line a b d removeSynth)))
   (xln
    (lambda (a b d)
      (XLine a b d removeSynth)))
   (rln
    (lambda (r a b d)
      (Line (Add a (Rand 0 r)) b d removeSynth)))
   (rxln
    (lambda (r a b d)
      (XLine (Add a (Rand 0 r)) b d removeSynth)))
   (prt
    (lambda (d a)
      (lambda (cf)
        (let* ((r1 (Rand cf (Add cf 2)))
               (r2 (rln 1 5 0.01 d))
               (r3 (rln 10 20 0 d))
               (r4 (Rand 0.1 0.2))
               (f (Add (Mce2 cf r1) (Mul (SinOsc r2 0) r3)))
               (o (FSinOsc f 0))
               (e (Mul (Decay2 (Impulse 0 0) r4 d) a)))
          (Mul o e)))))
   (np 12)
   (fp (RandN np 220 660))
   (d (Rand 4 7))
   (a (Rand 0.01 0.05)))
  (Mix (mceMap (prt d a) fp)))
