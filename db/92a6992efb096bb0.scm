; sweepy noise (jmcc) #6
(let* ((n (mceFill 2 (lambda (_) (WhiteNoise))))
       (lfo-depth (MouseY 200 8000 1 0.2))
       (lfo-rate (MouseX 4 60 1 0.2))
       (frEq (MulAdd (LFSaw lfo-rate 0)
                      lfo-depth
                      (Mul lfo-depth 1.2)))
       (filtered (RLPF (Mul n 0.03) frEq 0.1)))
  (Add (CombN filtered 0.3 0.3 2) filtered))
