; DemandEnvGen ; gate, MouseX on right side of screen toggles gate
(let* ((x (MouseX kr 0 1 0 0.1))
       (l (Round (Dwhite dinf 300 1000) 100))
       (f (DemandEnvGen kr l 0.1 5 0.3 (GT x 0.5) 1 1 0 1 doNothing)))
  (Mul (SinOsc ar (Mul f (Mce2 1 1.21)) 0) 0.1))
