; ToggleFf
(let* ((t (Impulse (MulAdd (LfNoise0 4) 16 24) 0))
       (g (ToggleFf t)))
  (Pan2
   (Saw (MidiCps (TRand 72 122 t)))
   (TRand -0.1 0.1 t)
   (Mul g (TRand 0.15 0.55 t))))
