; localIn ; ping-pong delay
(let* ((a0 (Mul (Decay (Impulse ar 0.3 0) 0.1) (Mul (WhiteNoise ar) 0.1)))
       (a1 (Add (LocalIn 2 ar 0) (Mce2 a0 0)))
       (a2 (DelayN a1 0.2 0.2)))
  (Mrg2 a2 (LocalOut (Mul (mceReverse a2) 0.8))))
