; forest sounds (paul jones)
(!
 (lambda ()
   (let* ((f (MulAdd (LfNoise2 50) 50 50))
          (o (MulAdd (SinOsc f 0) 100 2000)))
     (Mul (Bpf (BrownNoise) o 0.001) 10)))
 2)
