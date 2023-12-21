; LorenzL ; randomly modulate parameters
(Mul (LorenzL
     
      (SampleRate)
      (MulAdd (LfNoise0 1) 2 10)
      (MulAdd (LfNoise0 1) 20 38)
      (MulAdd (LfNoise0 1) 1.5 2)
      0.05
      0.1 0.0 0.0)
     0.1)
