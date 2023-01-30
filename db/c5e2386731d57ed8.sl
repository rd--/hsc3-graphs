;; LorenzL ; as a frequency control
SinOsc(Lag(LorenzL(MouseX(1, 200, 0, 0.2), 10, 28, 2.667, 0.05, 0.1, 0, 0), 0.003) * 800 + 900, 0) * 0.1
