; DelayMap ; simple feedback circuit (dynamic)
(let* ((b (ClearBuf (LocalBuf 1 88200)))
       (x (MouseX 0.05 1.05 0 0.1))
       (y (MouseY 0.05 0.95 0 0.1))
       (d (list -1  0 0 1
                y  0 1 x
                1 -1 0 1))
       (Pulse (lambda (f) (Mul (Decay (Impulse f 0) 0.1) (Mul (WhiteNoise) 0.2)))))
  (DelayMap b (Pulse (Mce2 1/3 5/4)) 1 d))
