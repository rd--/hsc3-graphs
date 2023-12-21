; K2A ; nested mce
(let ((g (Mce2 (LfNoise0 (Mce2 1 2)) (LfNoise1 (Mce2 2 3)))))
  (Mix (Mul3 (SinOsc (Mce2 440 441) 0) (K2A g) 0.1)))
