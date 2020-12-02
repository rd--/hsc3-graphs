; d-bufrd ; buffer as a time pattern
(let* ((b0 (as-local-buf (map (lambda (_) (s:exp-rand 200 500)) (make-list 24))))
       (b1 (as-local-buf (map (lambda (_) (s:l-choose (list 1 0.5 0.25))) (make-list 24))))
       (p (dseq dinf (mce2 (dseq 3 (make-mce (list 0 3 5 0 3 7 0 5 9)))
                           (dbrown 5 0 23 1))))
       (d (mul (dbufrd b1 (dseries dinf 0 1) 1) 0.5))
       (l (dbufrd b0 p 1)))
  (mul (sin-osc ar (duty kr d 0 do-nothing l) 0) 0.1))
