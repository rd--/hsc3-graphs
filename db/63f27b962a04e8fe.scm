; K2A
(let* ((freq (Mul (Fdiv (MouseX 0.1 40 1 0.1) (BlockSize)) (SampleRate))))
  (Mul
   (Mce2
    (K2A (LFNoise0 freq))
    (LFNoise0 freq))
   0.1))
