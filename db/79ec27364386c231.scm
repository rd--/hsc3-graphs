; Decay ; impulse triggers Decay to create an exponential decay envelope
(Mul (Decay (Impulse ar (XLine kr 1 50 20 removeSynth) 0.25) 0.1) (PinkNoise ar))
