; wial (rd)
(let*
  ((pls
    (lambda (clk div frq)
      (let* ((t (PulseDivider clk div 0))
             (e (Decay2 t 0.05 0.75))
             (f (MulAdd (ToggleFF t) frq (Mul 2 frq))))
        (foldl1 Mul (list (SinOsc ar f 0)
                          e
                          (TIRand 0 1 t)
                          0.5)))))
   (plss
    (lambda (clk descr)
      (mixList
       (map (lambda (l)
              (let ((d (list-ref l 0))
                    (f (list-ref l 1))
                    (a (list-ref l 2)))
                (Mul (pls clk d f) a)))
            descr))))
   (smpl
    (lambda (f)
      (list (list (Mce2 4 6)          f  0.75)
            (list (Mce2 2 6) (Mul f   2) 0.75)
            (list (Mce2 1 2) (Mul f  16) 0.025)
            (list (Mce2 1 5) (Mul f  64) 0.005)
            (list (Mce2 1 3) (Mul f 128) 0.035)
            (list (Mce2 1 4) (Mul f 256) 0.15)
            (list (Mce2 2 3) (Mul f 512) 0.35))))
   (clk (Impulse ar (LinLin (LFNoise2 kr 1.5) -1 1 7 28) 0)))
  (plss clk (smpl (TWChoose (Dust kr 1)
                             (Mce2 (* 20 2/3) 20)
                             (Mce2 0.25 0.75)
                             0))))
