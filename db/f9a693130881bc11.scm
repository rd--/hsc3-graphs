; duty
(let* ((dur (Drand dinf (Mce3 0.01 0.2 0.4)))
       (amp (Dseq dinf (asMce (list 204 400 201 502 300 200))))
       (f (Duty kr dur 0 doNothing amp)))
  (Mul (SinOsc ar (Mul f (Mce2 1 1.01)) 0) 0.1))
