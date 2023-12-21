; Select ; control rate ; if any input is not at audio rate select must be at control rate ; requires=kr:
(let* ((n 32)
       (a (MidiCps (Floor (RandN n 30 80))))
       (cycle (/ n 2))
       (w (MulAdd (LfSaw 1/2 0) cycle cycle)))
  (Mul (Saw (kr: (Select w a))) 0.05))
