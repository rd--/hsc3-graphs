; local-in ; ping-pong delay
(let* ((a0 (mul (decay (impulse ar 0.3 0) 0.1) (mul (white-noise ar) 0.1)))
       (a1 (add (local-in 2 ar 0) (mce2 a0 0)))
       (a2 (delay-n a1 0.2 0.2)))
  (mrg2 a2 (local-out (mul (mce-reverse a2) 0.8))))
