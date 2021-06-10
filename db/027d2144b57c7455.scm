; select
(let* ((a (Mce3 (SinOsc ar 440 0) (Saw ar 440) (Pulse ar 440 0.1)))
       (cycle 3/2)
       (w (MulAdd (LFSaw kr 1 0) cycle cycle)))
  (Mul (Select w a) 0.05))
