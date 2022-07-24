; RDelayMap ; simple feedback circuit (static)
(let ((b (ClearBuf (LocalBuf 1 88200)))
      (d (asMce (list -1  0  0 1
                      1/9 0  1  8/9
                      1   -1 0 1)))
      (Pulse (lambda (f) (Mul (Decay (Impulse f 0) 0.1) (Mul (WhiteNoise) 0.2)))))
  (RDelayMap b (Pulse 5/4) 0 d))
