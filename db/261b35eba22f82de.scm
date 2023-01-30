; Splay2
(Mul
 (Splay2
  (map
   (lambda (i)
     (Mul
      (SinOsc (* 220 i 1.6) 0)
      (Lag (LfPulse (+ (/ i 3) (sin i)) 3 0.1) 0.1)))
   '(1 2 3)))
 0.2)
