; SelectX ; composite ugen graph
(let* ((n 3/2)
       (f (Mce2 440 441))
       (a (Mce3 (SinOsc ar f 0) (Saw ar f) (Pulse ar f 0.1))))
  (Mul (Mix (SelectX (MulAdd (LFSaw kr 1 0) n n) a)) 0.2))
