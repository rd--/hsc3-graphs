; duty
(let* ((dur (MouseX kr 0.001 2 1 0.1))
       (amp (Dseq dinf (asMce (list 204 400 201 502 300 200))))
       (f (Duty kr dur 0 doNothing amp)))
  (Mul (SinOsc ar (Mul f (Mce2 1 1.0)) 0) 0.1))
