; LinCongC ; randomly modulate parameters
(Mul (LinCongC
     
      (MulAdd (LFNoise2 1.0) 1e4 1e4)
      (MulAdd (LFNoise2 0.1) 0.5 1.4)
      (MulAdd (LFNoise2 0.1) 0.1 0.1)
      (LFNoise2 0.1)
      0)
     0.1)
