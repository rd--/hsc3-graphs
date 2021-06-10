; tgb (rd) ; requires=buf
(let*
 ((mkls
   (lambda (bp t)
     (EnvGen kr 1 1 0 1 removeSynth (envBreakPointLinear bp t 1))))
  (pm/t
   (lambda (l r d t)
     (let ((LE (mkls l d))
           (re (mkls r d)))
       (TRand LE re t))))
  (wrp
   (lambda (i l r)
     (let ((m (FDiv (Sub r l) 2)))
       (MulAdd i m (Add l m)))))
  (pm/n
   (lambda (rt l r d)
     (let ((LE (mkls l d))
           (re (mkls r d)))
       (wrp (WhiteNoise rt) LE re))))
  (gb
   (lambda (b d)
     (let* ((gps (pm/n ar
                       (list 0 400 1 0900)
                       (list 0 600 1 1200)
                       d))
            (t (Impulse ar gps 0))
            (dur (pm/t (list 0 0.005 0.5 0.015 1 0.005)
                       (list 0 0.009 0.5 0.020 1 0.009)
                       d
                       t))
            (pan (pm/t (list 0 -1.0 0.5 -0.5 1 0.5)
                       (list 0 -0.5 0.5 +0.5 1 1.0)
                       d
                       t))
            (rate (pm/t (list 0 06 0.5 12 1 06)
                        (list 0 12 0.5 12 1 12)
                        d
                        t))
            (cpos (pm/t (list 0 0 1 0.95)
                        (list 0 0 1 1.00)
                        d
                        t))
            (amp (pm/t (list 0 0.25 0.5 0.55 1.0 0.15)
                       (list 0 0.50 0.5 0.75 1.0 0.25)
                       d
                       t)))
       (TGrains 2 t b rate (Mul cpos (BufDur kr b)) dur pan amp 2)))))
 (gb (ctl kr "buf" 0) 7)) ; longer ; 7 -> 60
