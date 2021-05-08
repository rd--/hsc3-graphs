; moogff
(let* ((p (Pulse ar (mce2 40 121) (mce2 0.3 0.7)))
       (f0 (lin-lin (LFNoise0 kr 0.43) -1 1 0.001 2.2))
       (f1 (lin-lin (SinOsc kr f0 0) -1 1 30 4200))
       (y (MouseY kr 1 4 0 0.1)))
  (Mul (MoogFF p f1 (Mul 0.83 y) 0) 0.25))
