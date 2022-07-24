; Select ; control rate ; if any input is not at audio rate select must be at control rate
(let* ((n 32)
       (a (MidiCps (Floor (RandN n 30 80))))
       (cycle (/ n 2))
       (w (MulAdd (LFSaw 1/2 0) cycle cycle)))
  (Mul (Saw (kr (Select w a))) 0.05))
