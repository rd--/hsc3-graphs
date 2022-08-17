; pattern localbuf (rd)
(let*
  ((tseq
    (lambda (l)
      (let ((n (/ (length l) 2)))
        (kr: (Select (MulAdd (LFSaw 0.5 0) n n) l)))))
   (mk-pattern
    (lambda (nf c)
      (let ((v (make-vector (* nf 2) 0)))
        (replicateM
         c
         (lambda ()
           (let ((r0 (rrand 0 nf))
                 (r1 (rand 1.0)))
             (vector-set! v r0 r1))))
        (vector->list v))))
   (nf (* 2 480))
   (c 24)
   (b (asLocalBuf (mk-pattern nf c)))
   (p (Phasor 0 (Mul (BufRateScale b) 0.5) 0 (BufFrames b) 0))
   (t (BufRd 1 b p 1 4))
   (r1 (replicateM c (lambda () (rrand 36 96))))
   (r2 (replicateM c (lambda () (rand2 1.0))))
   (r3 (rand 2))
   (n1 (TRand 0.02 0.08 t))
   (e (Decay2 t 0.01 n1))
   (f (MidiCps (tseq r1)))
   (l (tseq r2))
   (o (list-ref (list (SinOsc f 0) (Saw f)) r3)))
  (Pan2 o l (Mul e 0.1)))
