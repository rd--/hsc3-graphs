; sweepy noise (jmcc) #6
(let* ((lfoDepth (MouseY 200 8000 1 0.2))
       (lfoRate (MouseX 4 60 1 0.2))
       (frEq (MulAdd (LfSaw lfoRate 0)
                     lfoDepth
                     (Mul lfoDepth 1.2)))
       (filtered (Rlpf (Mul (WhiteNoiseN 2) 0.03) frEq 0.1)))
  (Add (CombN filtered 0.3 0.3 2) filtered))
