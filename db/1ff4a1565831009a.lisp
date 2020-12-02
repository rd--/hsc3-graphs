; demand-env-gen ; frequency modulation
(let* ((x (mouse-x kr -0.01 -4 0 0.1))
       (y (mouse-y kr 1 3000 1 0.1))
       (l (lambda () (dseq dinf (clone 32 (lambda () (exp-rand 200 1000))))))
       (t (mul sample-dur y))
       (f (demand-env-gen ar (mce2 (l) (l)) t 5 x 1 1 1 0 1 do-nothing)))
  (mul (sin-osc ar f 0) 0.1))
