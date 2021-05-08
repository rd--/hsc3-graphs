; DemandEnvGen ; frequency envelope with random times
(let* ((l (Dseq dinf (make-mce (list 204 400 201 502 300 200))))
       (t (Drand dinf (make-mce (list 1.01 0.2 0.1 2.0))))
       (y (MouseY kr 0.01 3 1 0.1))
       (f (DemandEnvGen ar l (Mul t y) 7 0 1 1 1 0 1 do-nothing)))
  (Mul (SinOsc ar (Mul f (mce2 1 1.01)) 0) 0.1))
