; HenonN ; randomly modulate parameters
(Mul (HenonN
              (Fdiv (SampleRate) 8)
              (MulAdd (LFNoise2 1) 0.20 1.20)
              (MulAdd (LFNoise2 1) 0.15 0.15)
              0
              0)
     0.05)
