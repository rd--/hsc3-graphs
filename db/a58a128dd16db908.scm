; forest sounds (paul jones)
(mceFill
 2
 (lambda (_)
   (let* ((n1 (BrownNoise))
          (n2 (LFNoise2 50))
          (f (MulAdd n2 50 50))
          (o (MulAdd (SinOsc f 0) 100 2000)))
     (Mul (BPF n1 o 0.001) 10))))
