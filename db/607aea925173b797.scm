; select
(let* ((n 32)
       (a (MidiCps (Floor (RRandN n 30 80))))
       (cycle (/ n 2))
       (w (MulAdd (LFSaw kr 1/2 0) cycle cycle)))
  (Mul (Saw ar (Select w a)) 0.05))
