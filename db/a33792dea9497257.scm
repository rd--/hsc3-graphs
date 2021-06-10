; k2a ; nested mce
(let ((g (Mce2 (LFNoise0 kr (Mce2 1 2)) (LFNoise1 kr (Mce2 2 3)))))
  (Mix (Mul3 (SinOsc ar (Mce2 440 441) 0) (K2A g) 0.1)))
