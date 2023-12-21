; 20061016 (rd) ; requires=buf
(let*
    ((mkls
      (lambda (bp t)
	(EnvGen 1 1 0 1 removeSynth (EnvBreakPointLinear bp t 1))))
     (pm/t
      (lambda (l r d t)
	(let ((le (mkls l d))
              (re (mkls r d)))
	  (TRand le re t))))
     (wrp
      (lambda (i l r)
	(let ((m (Div (Sub r l) 2)))
	  (MulAdd i m (Add l m)))))
     (pm/n
      (lambda (l r d)
	(let ((le (mkls l d))
              (re (mkls r d)))
	  (wrp (WhiteNoise) le re))))
     (gb
      (lambda (b d)
	(let* ((gps (pm/n
                     (list 400 1 0900)
                     (list 600 1 1200)
                     d))
               (t (Impulse gps 0))
               (dur (pm/t
		     (list 0.005 0.5 0.015 1 0.005)
                     (list 0.009 0.5 0.020 1 0.009)
                     d
                     t))
               (pan (pm/t
		     (list -1.0 0.5 -0.5 1 0.5)
                     (list -0.5 0.5 +0.5 1 1.0)
                     d
                     t))
               (rate (pm/t
		      (list 06 0.5 12 1 06)
                      (list 12 0.5 12 1 12)
                      d
                      t))
               (cpos (pm/t
		      (list 0 1 0.95)
                      (list 0 1 1.00)
                      d
                      t))
               (amp (pm/t
		     (list 0.25 0.5 0.55 1.0 0.15)
		     (list 0.50 0.5 0.75 1.0 0.25)
		     d
		     t)))
	  (TGrains 2 t b rate (Mul cpos (BufDur b)) dur pan amp 2)))))
  (gb (ctl "buf" 0) 7)) ; longer ; 7 -> 60
