; Gendy1 ; wasp
(let ((ad (MulAdd (SinOsc 0.1 0) 0.1 0.9)))
  (Pan2 (Gendy1 0 0 ad 1.0 50 1000 1 0.005 12 12) 0.0 0.1))
