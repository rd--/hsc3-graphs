; BufCombC ; LocalBuf does not need clearing, the delay Line is filled by the ugen
(let* ((d (mceFill 2 (lambda (_) (Dust ar 1))))
       (n (WhiteNoise ar))
       (z (Mul (Decay d 0.3) n))
       (l (XLine kr 0.0001 0.01 20 doNothing))
       (b (mceFill 2 (lambda (_) (LocalBuf 2 SampleRate)))))
  (Mul (BufCombC b z l 0.2) 0.2))
