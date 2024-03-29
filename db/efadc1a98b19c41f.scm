; DemandEnvGen ; frequency envelope with random times
(let* ((l (Dseq inf (list 204 400 201 502 300 200)))
       (t (Drand inf (list 1.01 0.2 0.1 2.0)))
       (y (MouseY 0.01 3 1 0.1))
       (f (DemandEnvGen l (Mul t y) 7 0 1 1 1 0 1 doNothing)))
  (Mul (SinOsc (Mul f (Mce2 1 1.01)) 0) 0.1))
