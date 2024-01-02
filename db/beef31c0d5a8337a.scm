; what was i thinking? (jmcc) #2
(let* ((n0 (MulAdd (LfNoise1 0.2) 2000 2400))
       (n1 (MulAdd (LfNoise1 0.157) 0.4 0.5))
       (i (Mul3 (LfPulse 0.1 0 0.05) (Impulse 8 0) 500))
       (d (Decay i 2))
       (f (Max (Add (SinOsc 4 0) 80) d))
       (p (Mul (Pulse f n1) 0.04))
       (z (Rlpf p n0 0.2))
       (c (lambda (x)
            (let* ((r (Rand 0 0.3))
                   (n (MulAdd (LfNoise1 r) 0.025 0.035)))
              (CombL x 0.06 n 1))))
       (y (Mul z 0.6)))
  (Add z (Mce2 (Add (c y) (c y))
               (Add (c y) (c y)))))