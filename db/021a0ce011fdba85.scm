; moogff
(let* ((p (Pulse (Mce2 40 121) (Mce2 0.3 0.7)))
       (f0 (LinLin (LFNoise0 0.43) -1 1 0.001 2.2))
       (f1 (LinLin (SinOsc f0 0) -1 1 30 4200))
       (y (MouseY 1 4 0 0.1)))
  (Mul (MoogFF p f1 (Mul 0.83 y) 0) 0.25))
