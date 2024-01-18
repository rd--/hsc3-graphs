{- Lpf ; modulate frequency -}
Lpf(WhiteNoise(), SinOsc([0.1, 0.13], pi) * [2300, 3000] + 3500) * 0.1
