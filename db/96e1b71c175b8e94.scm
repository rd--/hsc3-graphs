; http://sccode.org/1-e (jl)
(let* ((d0 (LPF (Dust2 (LinRange (LFNoise1 0.2) 40 50)) 7000))
       (n0 (MulAdd (PinkNoise) (MulAdd (LFNoise1 0.3) 0.02 0.08) d0))
       (e0 (Line 0 1 10 0))
       (p0 (Tanh (Mul3 3 (GVerb (HPF n0 400) 250 100 0.25 0.5 15 0.3 0.7 0.5 300) e0)))
       (lfNoise1C (lambda (f) (Clip (LFNoise1 f) 0 1)))
       (n1 (Mul (PinkNoise) (Pow (Mul (lfNoise1C 3) (lfNoise1C 2)) 1.8)))
       (f1 (LinExp (LFNoise1 1) -1 1 100 2500))
       (e1 (Line 0 0.7 30 0))
       (p1 (Mul (GVerb (Tanh (LPF (Mul 10 (HPF n1 20)) f1)) 270 30 0.7 0.5 15 0.5 0.7 0.5 300) e1)))
 (Mul (Limiter (Add p0 p1) 1 0.01) 0.2))