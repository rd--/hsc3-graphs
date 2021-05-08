; BufCombC ; LocalBuf does not need clearing, the delay Line is filled by the ugen
(let* ((d (clone 2 (lambda () (Dust ar 1))))
       (n (WhiteNoise ar))
       (z (Mul (Decay d 0.3) n))
       (l (XLine kr 0.0001 0.01 20 do-nothing))
       (b (clone 2 (lambda () (LocalBuf 2 SampleRate)))))
  (Mul (BufCombC b z l 0.2) 0.2))
