; schmidt
(let* ((In (LFNoise1 kr 3))
       (octave (Add (Schmidt In -0.15 0.15) 1))
       (f (Add (Mul In 200) (Mul 500 octave))))
  (Mul (SinOsc ar f 0) 0.1))
