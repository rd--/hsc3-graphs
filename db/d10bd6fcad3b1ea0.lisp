; fwalk (rd)
(let
  ((fwalk-i
    (lambda (r)
      (let* ((t (dust kr 3))
             (r1 (ti-rand 0 6 t))
             (r2 (t-rand -0.0001 0.0001 t))
             (b0 (as-local-buf (list 40.0 47.0 42.0 40.0 50.0
                                     43.0 35.0 43.0 40.0 47.0
                                     45.0 35.0 43.0 42.0 59.0
                                     48.0 40.0 47.0 52.0 45.0)))
             (b1 (as-local-buf (list 40.0 40.0 42.0 47.0 50.0
                                     35.0 43.0 43.0 40.0 45.0
                                     42.0 35.0 48.0 47.0 43.0
                                     40.0 59.0 45.0 47.0 52.0)))
             (f (buf-rd-l 1 kr (mce2 b0 b1) r1 no-loop))
             (o1 (blip ar (midi-cps (add r f)) 12))
             (o2 (blip ar (midi-cps (sum3 r f r2)) 12)))
        (mul3 (add o1 o2) (decay2 t 0.3 1.2) 0.1)))))
  (add (fwalk-i 24) (fwalk-i 36)))
