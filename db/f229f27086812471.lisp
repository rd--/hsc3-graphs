; dseq
(let* ((a (dseq dinf (rand-n 32 0 10)))
       (t (impulse ar (mouse-x kr 1 10000 1 0.1) 0))
       (f (mul-add (demand t 0 a) 30 340)))
  (mul (sin-osc ar f 0) 0.1))
