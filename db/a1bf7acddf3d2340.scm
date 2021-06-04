; plucked strings (jmcc)
(let ((s (lambda (_)
           (let* ((s0 (Mul (Impulse ar (Rand 2 2.2) 0) 0.3))
                  (s1 (Mul (Dust ar 0.5) 0.3))
                  (f (MulAdd (SinOsc kr (Rand 0.05 0.15) (Rand 0 (* pi 2))) 5 5.2))
                  (s2 (Mul (Impulse ar f 0) 0.3))
                  (im (Select (IRand 0 2) (mce3 s0 s1 s2)))
                  (dt (FDiv 1 (MIDICPS (Floor (Rand 60 90)))))
                  (t (mul3 (Decay im 0.1) (PinkNoise ar) 0.1)))
             (Pan2 (CombL t dt dt 4) (Rand -1 1) 1)))))
  (LeakDC (mix-fill 5 s) 0.96))