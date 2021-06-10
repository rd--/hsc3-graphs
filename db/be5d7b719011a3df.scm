; metal plate (jmcc)
(let* ((sr 48000)
       (n 4)
       (maxdt (ceiling (* sr 0.03)))
       (buf (map (lambda (_) (ClearBuf (LocalBuf 1 maxdt))) (enumFromTo 1 n)))
       (tapTime (replicateM n (lambda () (Rand 0.015 0.03))))
       (excFreq (MouseY kr 10 8000 linear 0.2))
       (excTrig (Mul (Impulse ar 0.5 0) 0.2))
       (exc (Mul (Decay2 excTrig 0.01 0.2) (LFNoise2 ar excFreq)))
       (del (zipWith (lambda (b tm) (Tap 1 ar b tm)) buf tapTime))
       (fltFreq (MouseX kr 10 5000 linear 0.2))
       (flt (map (lambda (i) (Mul (LPF i fltFreq) 0.98)) del))
       (rb (lambda (b f) (RecordBuf ar b 0 1 0 1 loop 1 doNothing (Add f exc))))
       (wr (zipWith rb buf flt)))
  (Mrg (cons (foldr1 Add flt) wr)))
