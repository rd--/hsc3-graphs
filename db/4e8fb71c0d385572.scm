; pluck
(let* ((n 25)
       (f (RandN n 0.05 0.2))
       (p (RandN n 0 1))
       (x (MouseX 60 1000 1 0.1))
       (o (LinLin (SinOsc f p) -1 1 x 3000))
       (w (Mul (WhiteNoiseN n) 0.1))
       (i (Impulse (RandN n 10 12) 0))
       (ks (Pluck w i 0.01 (Fdiv 1 o) 2 (Rand 0.01 0.2)))
       (l (RandN n -1 1)))
  (LeakDC (Mix (Pan2 ks l 1)) 0.995))
