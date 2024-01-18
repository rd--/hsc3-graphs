; HenonN ; randomly modulate parameters
(Mul (HenonN
              (Div (SampleRate) 8)
              (MulAdd (LfNoise2 1) 0.20 1.20)
              (MulAdd (LfNoise2 1) 0.15 0.15)
              0
              0)
     0.05)
