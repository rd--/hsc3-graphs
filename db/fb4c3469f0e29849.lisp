; LinCongC ; frequency control
(Mul (SinOsc ar (MulAdd (LinCongC
                           ar
                           40
                           (MulAdd (LFNoise2 kr 0.1) 0.1 1.0)
                           (MulAdd (LFNoise2 kr 0.1) 0.1 0.1)
                           (LFNoise2 kr 0.1)
                           0)
                          500 600) 0)
     0.1)
