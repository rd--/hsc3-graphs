; BufCombC ; LocalBuf does not need clearing, the delay Line is filled by the ugen
(let* ((d (! (lambda () (Dust 1)) 2))
       (n (WhiteNoise))
       (z (Mul (Decay d 0.3) n))
       (l (XLn 0.0001 0.01 20))
       (b (! (lambda () (LocalBuf 2 (SampleRate))) 2)))
  (Mul (BufCombC b z l 0.2) 0.2))
