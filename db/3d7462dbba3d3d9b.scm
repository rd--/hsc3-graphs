; DemandEnvGen ; gate, MouseX on right side of screen toggles gate
(let* ((x (MouseX 0 1 0 0.1))
       (l (RoundTo (Dwhite inf 300 1000) 100))
       (f (DemandEnvGen l 0.1 5 0.3 (Gt x 0.5) 1 1 0 1 doNothing)))
  (Mul (SinOsc (Mul f (Mce2 1 1.21)) 0) 0.1))
