; http://sccode.org/1-j#c51 (jl)
(let* ((x (LocalIn 2 ar 0))
       (a (TanH (Mul (Mul (SinOsc ar 65 (Mul (Mul x (LFNoise1 ar 0.1)) 3)) (LFNoise1 ar 3)) 6)))
       (f (lambda (i) (AllpassN i 0.3 (RRandN 2 0.1 0.3) 5)))
       (o (tanh (iter 9 f a))))
  (mrg2 (Mul o 0.2) (LocalOut o)))
