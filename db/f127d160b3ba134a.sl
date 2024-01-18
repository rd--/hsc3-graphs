{- LfPulse ; as envelope -}
SinOsc(200, 0) * Lag(LfPulse(7.83, 0, 0.5) > 0, 0.05) * 0.2
