; http://sccode.org/1-9 (jl) ; edit for packet size
(let* ((n 956)
       (k 65) ; 98
       (a (Mul (HPF (Mul (PinkNoise ar) 0.005) 10) (Line kr 0 1 9 0)))
       (f (lambda (i) (Ringz (Mul a (LFNoise1 kr (Add 0.05 (Rand 0 0.1)))) (MulAdd 55 (Add i n) 60) 0.2))))
  (TanH (GVerb (mixFill k f) 70 99 0.5 0.5 15 1 0.7 0.5 300)))
