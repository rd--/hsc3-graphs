; ToggleFf
(let* ((t (Impulse (LinLin (LfNoise0 4) -1 1 16 48) 0))
       (g (Lag (ToggleFf t) 0.075)))
  (Pan2
   (Blip (MidiCps (TRand 72 79 t)) (TRand 2 9 t))
   (TRand -0.5 0.5 t)
   (Mul g (TRand 0.25 0.75 t))))
