; duty
(let* ((dur (Drand dinf (mce3 0.01 0.2 0.4)))
       (amp (Dseq dinf (make-mce (list 204 400 201 502 300 200))))
       (f (Duty kr dur 0 do-nothing amp)))
  (Mul (SinOsc ar (Mul f (mce2 1 1.01)) 0) 0.1))
