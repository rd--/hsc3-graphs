; duty
(let* ((dur (mouse-x kr 0.001 2 1 0.1))
       (amp (dseq dinf (make-mce (list 204 400 201 502 300 200))))
       (f (duty kr dur 0 do-nothing amp)))
  (mul (sin-osc ar (mul f (mce2 1 1.0)) 0) 0.1))
