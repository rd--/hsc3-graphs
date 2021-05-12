; duty
(let* ((dur (MouseX kr 0.001 2 1 0.1))
       (amp (Dseq dinf (make-mce (list 204 400 201 502 300 200))))
       (f (Duty kr dur 0 do-nothing amp)))
  (Mul (SinOsc ar (Mul f (mce2 1 1.0)) 0) 0.1))
