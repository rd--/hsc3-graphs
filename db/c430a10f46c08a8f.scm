; rzblp (rd)
(let*
 ((wrp
   (lambda (i l r)
     (let ((m (FDiv (Sub r l) 2)))
       (MulAdd i m (Add l m)))))
  (lfn
   (lambda (f l r)
     (wrp (LFNoise0 kr f) l r)))
  (hpb
   (lambda (q)
     (mixFill
      2
      (lambda (_)
        (let ((f (lfn q 1330 1395))
              (a (lfn q 0.001 0.007)))
          (Mul (Blip ar f 24) a))))))
  (f
   (lambda (u)
     (let* ((q (lfn 5.2 5.2 5.21))
            (a (u dinf (Mce5 1 3 2 7 8)))
            (Trig (Impulse kr q 0))
            (frEQ_ (MulAdd (Demand Trig 0 a) 30 340)))
       (foldl1 Add
               (list (Mul (Blip ar frEQ_ 3)
                          (lfn q 0.001 0.01))
                     (Mul (Resonz (Impulse ar q (Mce2 0 0))
                                  (lfn 5 30 640)
                                  (lfn q 0.1 0.5))
                          (lfn q 0.01 1.8))
                     (Mul (hpb q)
                          (lfn q 1.2 1.8))
                     (Mul (Blip ar (lfn q 16 36) 3)
                          (Mce2 0.03 0.09))))))))
 (Add (f Drand) (f Dxrand)))
