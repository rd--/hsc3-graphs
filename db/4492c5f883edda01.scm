; DemandEnvGen ; frequency modulation
(let* ((x (MouseX kr -0.01 -4 0 0.1))
       (y (MouseY kr 1 3000 1 0.1))
       (l (lambda () (Dseq dinf (clone 32 (lambda () (ExpRand 200 1000))))))
       (t (Mul SampleDur y))
       (f (DemandEnvGen ar (mce2 (l) (l)) t 5 x 1 1 1 0 1 do-nothing)))
  (Mul (SinOsc ar f 0) 0.1))
