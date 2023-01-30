; ToggleFf
(let* ((t (Impulse (LinLin (LfNoise0 4) -1 1 16 24) 0))
       (g (ToggleFf t)))
  (Pan2
   (Saw (MidiCps (TRand 92 132 t)))
   (TRand -0.15 0.15 t)
   (Mul g (TRand 0.05 0.75 t))))
