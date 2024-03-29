; 20061029 (rd)
(let* ((wrp (lambda (i l r) (LinLin i -1 1 l r)))
       (stream (lambda (y ti t lf rf ld rd g)
                 (lambda ()
                   (let* ((r1 (Rand 9 18))
                          (t* (PulseDivider t r1 0))
                          (r2 (TRand lf (wrp ti lf rf) t*))
                          (r3 (TRand ld rd t*)))
                     (Mul (Ringz (Decay2 t* 0.01 0.5) r2 (Mul r3 y)) g)))))
       (x (MouseX 0.05 0.35 0 0.1))
       (y (MouseY 0.15 0.75 0 0.1))
       (ti (LfTri x 0))
       (tf (wrp ti 100 200))
       (t (Impulse tf 0))
       (s1 (stream y ti t 3140 6240 0.050 0.005 0.15))
       (s2 (stream y ti t 0400 9000 0.005 0.005 0.15)))
  (Add (! s1 2) (! s2 2)))
