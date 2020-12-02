; gendy1 ; another traffic moment
(let* ((i 10)
       (x (mouse-x kr 100 2000 0 0.1))
       (y (mouse-y kr 0.01 1.0 0 0.1))
       (b (mouse-button kr 0 1 0.1))
       (z (mix-fill
           i
           (lambda (_)
             (let* ((f (rand 50 560.3))
                    (n (rand 2 20))
                    (k (mul-add (sin-osc kr (exp-rand 0.02 0.2) 0)
                                (f-div n 2)
                                (f-div n 2)))
                    (g (gendy1 ar
                               (rand 0 6) (rand 0 6) (rand 0 1) (rand 0 1) f f
                               (rand 0 1) (rand 0 1) n k)))
               (pan2 g (rand -1 1) (f-div 0.1 (sqrt i))))))))
  (add (mul b z) (mul (sub 1 b) (resonz z x y))))
