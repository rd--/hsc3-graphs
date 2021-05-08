; fwalk (rd)
(let
  ((fwalk-i
    (lambda (r)
      (let* ((t (Dust kr 3))
             (r1 (TIRand 0 6 t))
             (r2 (TRand -0.0001 0.0001 t))
             (b0 (as-local-buf (list 40.0 47.0 42.0 40.0 50.0
                                     43.0 35.0 43.0 40.0 47.0
                                     45.0 35.0 43.0 42.0 59.0
                                     48.0 40.0 47.0 52.0 45.0)))
             (b1 (as-local-buf (list 40.0 40.0 42.0 47.0 50.0
                                     35.0 43.0 43.0 40.0 45.0
                                     42.0 35.0 48.0 47.0 43.0
                                     40.0 59.0 45.0 47.0 52.0)))
             (f (BufRd 1 kr (mce2 b0 b1) r1 no-loop 2))
             (o1 (Blip ar (MIDICPS (Add r f)) 12))
             (o2 (Blip ar (MIDICPS (Sum3 r f r2)) 12)))
        (mul3 (Add o1 o2) (Decay2 t 0.3 1.2) 0.1)))))
  (Add (fwalk-i 24) (fwalk-i 36)))
