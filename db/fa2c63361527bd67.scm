; 20060910 (rd)
(let*
    ((wrp
      (lambda (i l r)
	(let ((m (Div (Sub r l) 2)))
	  (MulAdd i m (Add l m)))))
     (lfn
      (lambda (f l r)
	(wrp (LfNoise0 f) l r)))
     (hpb
      (lambda (q)
	(!
	 (lambda ()
           (let ((f (lfn q 1330 1395))
		 (a (lfn q 0.001 0.007)))
             (Mul (Blip f 24) a)))
	 2)))
     (f
      (lambda (u)
	(let* ((q (lfn 5.2 5.2 5.21))
               (a (u inf (Mce5 1 3 2 7 8)))
               (tr (Impulse q 0))
               (freq (MulAdd (Demand tr 0 a) 30 340)))
	  (Add4 (Mul (Blip freq 3)
                     (lfn q 0.001 0.01))
		(Mul (Resonz (Impulse q (Mce2 0 0))
                             (lfn 5 30 640)
                             (lfn q 0.1 0.5))
                     (lfn q 0.01 1.8))
		(Mul (hpb q)
                     (lfn q 1.2 1.8))
		(Mul (Blip (lfn q 16 36) 3)
                     (Mce2 0.03 0.09)))))))
  (Add (f Drand) (f Dxrand)))
