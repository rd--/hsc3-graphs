; Decay2 ; an envelope
(Mul3 (Decay2 (Impulse ar (XLine kr 1 50 20 removeSynth) 0.25) 0.01 0.2)
      (FSinOsc ar 600 0)
      0.25)
