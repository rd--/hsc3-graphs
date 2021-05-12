; HenonN ; randomly modulate parameters
(Mul (HenonN ar
              (FDiv SampleRate 8)
              (MulAdd (LFNoise2 kr 1) 0.20 1.20)
              (MulAdd (LFNoise2 kr 1) 0.15 0.15)
              0
              0)
     0.05)
