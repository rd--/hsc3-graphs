; ToggleFf
(let* ((t (Impulse (MulAdd (LfNoise2 4) 7 23) 0))
       (g (ToggleFf t)))
  (Pan2
   (Blip (MidiCps (TRand 23 135 t)) (TRand 3 23 t))
   (TRand -0.5 0.5 t)
   (Mul g (TRand 0.25 0.75 t))))
