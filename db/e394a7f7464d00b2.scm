; http://www.fredrikolofsson.com/f0blog/?q=node/490 (f0)
(let* ((f0 (Add (List 100 200 300) (SinOsc (List 0.11 0.22 0.33) 0)))
       (ph0 (Mul3 (SinOsc (List 0.1 0.2 0.3) 0) 2 pi))
       (a0 (MulAdd (SinOsc (List 0.01 0.02 0.03) 0) 0.05 0.1))
       (i (Mul (SinOsc f0 ph0) a0))
       (w (SinOsc (MulAdd (SinOsc (MulAdd (SinOsc 0.13 0) 5 6) 0) 8 50) 0))
       (s (Splay i w 0.7 (Mul (SinOsc 1.2 0) 0.6) #t)))
  (Mix (Transpose (GVerb s 20 5 1 0.5 25 0 1 1 30))))
