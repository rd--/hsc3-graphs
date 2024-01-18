{- LfPulse ; as envelope -}
SinOsc(230, 0) * Lag(LfPulse(MouseX(2.3, 23, 1, 0.2), 0, 0.5).Max(0), 0.01) * 0.2
