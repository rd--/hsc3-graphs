; demand-env-gen ; frequency envelope with random times
(let* ((l (dseq dinf (make-mce (list 204 400 201 502 300 200))))
       (t (drand dinf (make-mce (list 1.01 0.2 0.1 2.0))))
       (y (mouse-y kr 0.01 3 1 0.1))
       (f (demand-env-gen ar l (mul t y) 7 0 1 1 1 0 1 do-nothing)))
  (mul (sin-osc ar (mul f (mce2 1 1.01)) 0) 0.1))
