; Select ; audio rate ; all inputs must be at audio rate
(let* ((a (Mce3 (SinOsc 440 0) (Saw 440) (Pulse 440 0.1)))
       (cycle 3/2)
       (w (MulAdd (LFSaw 1 0) cycle cycle)))
  (Mul (Select w a) 0.05))
