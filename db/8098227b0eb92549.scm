; http://sccode.org/1-Z (jl) ; requires=kr
(let* ((a (kr: (Lag (Impulse 8 0) 0.1)))
       (b (Crackle (Mul (kr: (Lag (Abs (LfSaw 3 0)) 0.1)) 1.8)))
       (c (Mul a b))
       (d (kr: (Lag (Add (Impulse 2 0) (Impulse 4 0.5)) 0.1)))
       (e (Mul (Blip 4.9 7) 0.4))
       (f (Mul d e)))
 (Mul (Tanh (Mul (Add c (GVerb f 1 1 0.5 0.5 15 1 0.7 0.5 300)) 5)) 0.25))
