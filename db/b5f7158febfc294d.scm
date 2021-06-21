; pattern localbuf (rd)
(let*
  ((tseq
    (lambda (l)
      (let ((n (/ (length l) 2)))
        (Select (MulAdd (LFSaw kr 0.5 0) n n) (asMce l)))))
   (mk-pattern
    (lambda (nf c)
      (let ((v (make-vector (* nf 2) 0)))
        (replicateM
         c
         (lambda ()
           (let ((r0 (s:irand 0 nf))
                 (r1 (s:rand 0 1)))
             (vector-set! v r0 r1))))
        (vector->list v))))
   (nf (* 2 480))
   (c 24)
   (b (asLocalBuf 1 (mk-pattern nf c)))
   (p (Phasor ar 0 (Mul (BufRateScale kr b) 0.5) 0 (BufFrames kr b) 0))
   (t (BufRd 1 ar b p 1 4))
   (r1 (replicateM c (lambda () (s:rand 36 96))))
   (r2 (replicateM c (lambda () (s:rand -1 1))))
   (r3 (s:irand 0 2))
   (n1 (TRand 0.02 0.08 t))
   (e (Decay2 t 0.01 n1))
   (f (MidiCps (tseq r1)))
   (l (tseq r2))
   (o (list-ref (list (SinOsc ar f 0) (Saw ar f)) r3)))
  (Pan2 o l (Mul e 0.1)))