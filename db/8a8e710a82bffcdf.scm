; LinCongC ; randomly modulate parameters
(Mul (LinCongC
     
      (MulAdd (LfNoise2 1.0) 1e4 1e4)
      (MulAdd (LfNoise2 0.1) 0.5 1.4)
      (MulAdd (LfNoise2 0.1) 0.1 0.1)
      (LfNoise2 0.1)
      0)
     0.1)
