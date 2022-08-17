; localIn ; ping-pong delay
(let* ((a0 (Mul (Decay (Impulse 0.3 0) 0.1) (Mul (WhiteNoise) 0.1)))
       (a1 (Add (LocalIn 2 0) (List a0 0)))
       (a2 (DelayN a1 0.2 0.2)))
  (Mrg2 a2 (LocalOut (Mul (Reverse a2) 0.8))))
