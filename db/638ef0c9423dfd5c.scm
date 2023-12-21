; LinCongC ; frequency control
(Mul (SinOsc (MulAdd (LinCongC
                          
                           40
                           (MulAdd (LfNoise2 0.1) 0.1 1.0)
                           (MulAdd (LfNoise2 0.1) 0.1 0.1)
                           (LfNoise2 0.1)
                           0)
                          500 600) 0)
     0.1)
