; LatoocarfianC ; randomly modulate all parameters
(Mul (LatoocarfianC
      ar
      (FDiv SampleRate 4)
      (MulAdd (LFNoise2 kr 2) 1.5 1.5)
      (MulAdd (LFNoise2 kr 2) 1.5 1.5)
      (MulAdd (LFNoise2 kr 2) 0.5 1.5)
      (MulAdd (LFNoise2 kr 2) 0.5 1.5)
      0.5
      0.5)
     0.05)
