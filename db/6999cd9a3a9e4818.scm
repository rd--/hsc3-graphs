; schmidt
(let* ((In (LfNoise1 3))
       (octave (Add (Schmidt In -0.15 0.15) 1))
       (f (Add (Mul In 200) (Mul 500 octave))))
  (Mul (SinOsc f 0) 0.1))
