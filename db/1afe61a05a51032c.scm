; k2a ; nested mce
(let ((g (mce2 (LFNoise0 kr (mce2 1 2)) (LFNoise1 kr (mce2 2 3)))))
  (mix (mul3 (SinOsc ar (mce2 440 441) 0) (K2A g) 0.1)))
