; K2A ; nested mce
(let ((g (Mce2 (LFNoise0 (Mce2 1 2)) (LFNoise1 (Mce2 2 3)))))
  (Mix (Mul3 (SinOsc (Mce2 440 441) 0) (K2A g) 0.1)))
