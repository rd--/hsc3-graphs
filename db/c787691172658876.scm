; SelectX ; composite ugen graph ; audio rate
(let* ((n 3/2)
       (f (Mce2 440 441))
       (a (Mce3 (SinOsc f 0) (Saw f) (Pulse f 0.1))))
  (Mul (Mix (SelectX (MulAdd (LfSaw 1 0) n n) a)) 0.1))
