; forest sounds (paul jones)
(let* ((f (MulAdd (LfNoise2N 2 50) 50 50))
       (o (MulAdd (SinOsc f 0) 100 2000)))
  (Mul (Bpf (BrownNoiseN 2) o 0.001) 10))
