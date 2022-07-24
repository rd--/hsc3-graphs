; DemandEnvGen ; frequency modulation
(let* ((x (MouseX -0.01 -4 0 0.1))
       (y (MouseY 1 3000 1 0.1))
       (l (lambda () (Dseq dinf (mceFill 32 (lambda (_) (ExpRand 200 1000))))))
       (t (Mul (SampleDur) y))
       (f (DemandEnvGen (Mce2 (l) (l)) t 5 x 1 1 1 0 1 doNothing)))
  (Mul (SinOsc f 0) 0.1))
