; sweepy noise (jmcc) #6
(let* ((n (clone 2 (lambda () (WhiteNoise ar))))
       (lfo-depth (MouseY kr 200 8000 1 0.2))
       (lfo-rate (MouseX kr 4 60 1 0.2))
       (frEQ (MulAdd (LFSaw kr lfo-rate 0)
                      lfo-depth
                      (Mul lfo-depth 1.2)))
       (filtered (RLPF (Mul n 0.03) frEQ 0.1)))
  (Add (CombN filtered 0.3 0.3 2) filtered))
