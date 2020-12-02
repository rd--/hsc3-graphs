; d-bufrd
(let* ((b (as-local-buf (map (lambda (_) (s:exp-rand 200 500)) (make-list 24))))
       (q (dseq 3 (make-mce (list 0 3 5 0 3 7 0 5 9))))
       (p (dseq dinf (mce2 q (dbrown 5 0 23 1))))
       (t (dust kr 10)))
  (mul (sin-osc ar (demand t 0 (dbufrd b p 1)) 0) 0.1))
