; ToggleFf
(let* ((t (Impulse (MulAdd (LfNoise0 4) 9 21) 0))
       (g (ToggleFf t)))
  (Pan2
   (Blip (MidiCps (TRand 22 54 t)) (TRand 2 5 t))
   (TRand -0.5 0.5 t)
   (Mul g (TRand 0.05 0.25 t))))
